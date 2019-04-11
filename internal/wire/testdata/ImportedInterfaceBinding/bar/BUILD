load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")

go_library(
    name = "go_default_library",
    srcs = ["bar.go"],
    importpath = "github.com/maxbrunsfeld/counterfeiter/internal/wire/testdata/ImportedInterfaceBinding/bar",
    visibility = ["//visibility:private"],
    deps = ["@com_github_google_wire//:go_default_library"],
)

go_binary(
    name = "bar",
    embed = [":go_default_library"],
    visibility = ["//:__subpackages__"],
)
