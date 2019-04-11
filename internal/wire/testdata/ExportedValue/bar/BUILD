load("@io_bazel_rules_go//go:def.bzl", "go_library")
load("//skylark:rule.bzl", "wire_library")

wire_library(
    name = "go_default_library",
    srcs = ["bar.go"],
    importpath = "github.com/google/wire/internal/wire/testdata/ExportedValue/bar",
    visibility = ["//:__subpackages__"],
    deps = ["//:go_default_library"],
)
