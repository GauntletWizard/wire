load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")

go_library(
    name = "go_default_library",
    srcs = ["bar.go"],
    importpath = "github.com/google/wire/internal/wire/testdata/ImportedInterfaceBinding/bar",
    visibility = ["//visibility:private"],
    deps = ["//:go_default_library"],
)

go_binary(
    name = "bar",
    embed = [":go_default_library"],
    visibility = ["//:__subpackages__"],
)
