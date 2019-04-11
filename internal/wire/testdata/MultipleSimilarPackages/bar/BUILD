load("@io_bazel_rules_go//go:def.bzl", "go_library")

go_library(
    name = "go_default_library",
    srcs = ["bar.go"],
    importpath = "github.com/maxbrunsfeld/counterfeiter/internal/wire/testdata/MultipleSimilarPackages/bar",
    visibility = ["//:__subpackages__"],
)
