load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")

go_library(
    name = "go_default_library",
    srcs = [
        "main.go",
        "wire_gen.go",
    ],
    importpath = "github.com/maxbrunsfeld/counterfeiter/_tutorial",
    visibility = ["//visibility:private"],
)

go_binary(
    name = "_tutorial",
    embed = [":go_default_library"],
    visibility = ["//visibility:public"],
)
