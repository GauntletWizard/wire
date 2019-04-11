load("@io_bazel_rules_go//go:def.bzl", "go_library")
load("//skylark:rule.bzl", "wire_library")

wire_library(
    name = "go_default_library",
    srcs = ["anon1.go"],
    importpath = "github.com/google/wire/internal/wire/testdata/PkgImport/anon1",
    visibility = ["//:__subpackages__"],
)
