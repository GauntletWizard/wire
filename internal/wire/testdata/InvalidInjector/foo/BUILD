load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")

go_library(
    name = "go_default_library",
    srcs = ["foo.go"],
    importpath = "github.com/google/wire/internal/wire/testdata/InvalidInjector/foo",
    visibility = ["//visibility:private"],
)

go_binary(
    name = "foo",
    embed = [":go_default_library"],
    visibility = ["//:__subpackages__"],
)
