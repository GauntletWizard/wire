load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")

go_library(
    name = "go_default_library",
    srcs = ["wire_gen.go"],
    importpath = "github.com/google/wire/internal/wire/testdata/ExportedValueDifferentPackage/want",
    visibility = ["//visibility:private"],
)

go_binary(
    name = "want",
    embed = [":go_default_library"],
    visibility = ["//:__subpackages__"],
)
