load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")

go_library(
    name = "go_default_library",
    srcs = [
        "main.go",
        "wire_gen.go",
    ],
    importpath = "github.com/google/wire/_tutorial",
    visibility = ["//visibility:private"],
)

go_binary(
    name = "tutorial",
    embed = [":go_default_library"],
    visibility = ["//visibility:public"],
)
