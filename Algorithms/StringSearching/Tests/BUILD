package(default_visibility = ["//visibility:private"])

load("@build_bazel_rules_apple//apple:macos.bzl", "macos_unit_test")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

macos_unit_test(
    name = "Tests",
    minimum_os_version = "10.13",
    deps = [":TestsLib"],
)

swift_library(
    name = "TestsLib",
    srcs = glob(["*.swift"]),
    resources = [":Resources"],
    deps = ["//Algorithms/StringSearching"],
)

filegroup(
    name = "Resources",
    srcs = [
        "LoremIpsum-Big.txt",
        "LoremIpsum-Small.txt",
    ],
)
