load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")

go_library(
    name = "go_default_library",
    srcs = ["main.go"],
    importpath = "github.com/maxbrunsfeld/counterfeiter/cmd/wire",
    visibility = ["//visibility:private"],
    deps = [
        "@com_github_google_wire//internal/wire:go_default_library",
        "@com_github_pmezard_go_difflib//difflib:go_default_library",
        "@org_golang_x_tools//go/types/typeutil:go_default_library",
    ],
)

go_binary(
    name = "wire",
    embed = [":go_default_library"],
    visibility = ["//visibility:public"],
)
