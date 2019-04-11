load("@io_bazel_rules_go//go:def.bzl", "go_library")

go_library(
    name = "go_default_library",
    srcs = ["bar.go"],
    importpath = "github.com/maxbrunsfeld/counterfeiter/internal/wire/testdata/ExportedValueDifferentPackage/bar",
    visibility = ["//:__subpackages__"],
    deps = ["@com_github_google_wire//:go_default_library"],
)
