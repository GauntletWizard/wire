load(
    "@io_bazel_rules_go//go:def.bzl",
    "GoArchive",
    "GoLibrary",
    "GoPath",
    "GoSource",
    _go_context = "go_context",
    _go_library = "go_library",
    _go_path = "go_path",
    _go_rule = "go_rule",
)

def _wire_runner_impl(ctx):
    go = _go_context(ctx)
    binary = ctx.file.wire_binary
    pkg_dir = ctx.label.package

    # importpath = ctx.attr.package[GoLibrary].importpath
    # Our output is a single predictable file.
    output_file = ctx.actions.declare_file("wire_gen.go")

    ctx.actions.run_shell(
        mnemonic = "WireGen",
        inputs = ctx.attr.package[GoSource].srcs + go.sdk.srcs + go.sdk.headers,
        outputs = [output_file],
        tools = [
            binary,
            go.go,
            ctx.attr.path[GoPath].gopath_file,
        ] + go.sdk.tools,
        env = go.env + {
            "GOBIN": go.go.dirname,
            "GOPATH": ctx.attr.path[GoPath].gopath_file.path,
            "BINPATH": binary.dirname,
        },
        # First, set up a whole bunch of go context for our `go list` bits
        command = "export GOPATH=\"$PWD/$GOPATH\" PATH=\"$PATH:$PWD/$GOBIN:$PWD/$BINPATH\" GOCACHE=\"$TMPDIR\" GOROOT=\"$PWD/$GOROOT\";" +
                  # and then run our command, then copy it's output to the right place.
                  "cd %s && %s && cd - && cp %s/wire_gen.go %s" % (pkg_dir, binary.basename, pkg_dir, output_file.path),
    )

    return DefaultInfo(
        files = depset([output_file]),
    )

wire_runner = _go_rule(
    implementation = _wire_runner_impl,
    attrs = {
        "package": attr.label(
            doc = "A go_library label representing the package, (usually :go_default_library)",
            providers = [GoLibrary],
        ),
        "path": attr.label(
            doc = "A go_path label representing the package, (usually :go_default_library)",
            providers = [GoPath],
        ),
        "wire_binary": attr.label(
            doc = "The wire executable, as a bazel label. No need to change.",
            default = "//cmd/wire:wire",
            allow_single_file = True,
        ),
    },
)

# When building a wire output, we form a vaugely diamond dependency tree. We need a version of the go_library that includes wire.go for building the wire_gen.go, and one containing wire_gen.go and not wire.go for building the library that is imported elsewhere
def wire_library(name, importpath = "", srcs = [], deps = [], **kwargs):
    """A wire_library is equivalent to a rules_go go_library with "wire_gen.go" compiled in.

    Do not include either "wire.go" or "wire_gen.go" in the srcs list."""

    # Both wire.go and wire_gen.go import the base library from this workspace, so ensure it's in our deps list.
    wire_lib = Label("//:go_default_library")
    deps = depset(direct = [str(wire_lib)] + deps)

    generation_library = name + "_wirelib_"

    # This library won't actually build because the build constraing prevents wire.go from compiling, but all it's used for is generating the path
    _go_library(
        name = generation_library,
        importpath = importpath,
        srcs = srcs + ["wire.go"],
        deps = deps,
        **kwargs
    )

    # I'm about 90% sure this is unnecessary and we can instead use the precompiled form of nearly everything. But only 90%
    generation_path = name + "_wirepath_"
    _go_path(
        name = generation_path,
        deps = [":" + generation_library],
    )
    wirerunner_name = name + "_wirerunner_"
    wire_runner(
        name = wirerunner_name,
        package = ":" + generation_library,
        path = ":" + generation_path,
    )

    # The big kahuna: Our real library.
    _go_library(
        name = name,
        importpath = importpath,
        srcs = srcs + [":" + wirerunner_name],
        deps = deps,
        **kwargs
    )
