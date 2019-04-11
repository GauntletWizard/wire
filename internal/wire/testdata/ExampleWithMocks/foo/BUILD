load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")
load("//skylark:rule.bzl", "wire_library")

wire_library(
    name = "go_default_library",
    srcs = ["foo.go"],
    importpath = "github.com/google/wire/internal/wire/testdata/ExampleWithMocks/foo",
    visibility = ["//visibility:private"],
    deps = ["//:go_default_library"],
)

go_binary(
    name = "foo",
    embed = [":go_default_library"],
    visibility = ["//:__subpackages__"],
)
