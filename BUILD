# Rules for golang support
load("@io_bazel_rules_go//go:def.bzl", "go_library")
# End golang support

# Rules to run Gazelle
# gazelle:prefix github.com/google/wire
# gazelle:build_file_name BUILD,BUILD.bazel
load("@bazel_gazelle//:def.bzl", "gazelle")

gazelle(name = "gazelle")
# End Gazelle

# The go_library rule is automatically built by Gazelle - Updated with the files in the library, and the necessary dependencies.
go_library(
    name = "go_default_library",
    srcs = ["wire.go"],
    importpath = "github.com/google/wire",
    visibility = ["//visibility:private"],
)
