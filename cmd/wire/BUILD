load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")

go_library(
    name = "go_default_library",
    srcs = ["main.go"],
    importpath = "github.com/google/wire/cmd/wire",
    visibility = ["//visibility:private"],
    deps = [
        "//internal/wire:go_default_library",
        "@com_github_pmezard_go_difflib//difflib:go_default_library",
        "@org_golang_x_tools//go/types/typeutil:go_default_library",
    ],
)

go_binary(
    name = "wire",
    embed = [":go_default_library"],
    visibility = ["//visibility:public"],
)
