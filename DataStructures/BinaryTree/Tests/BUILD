package(default_visibility = ["//visibility:private"])

load("@build_bazel_rules_apple//apple:macos.bzl", "macos_unit_test")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

macos_unit_test(
    name = "Tests",
    deps = [":TestsLib"],
)

swift_library(
    name = "TestsLib",
    srcs = ["BinaryTreeTests.swift"],
    deps = ["//DataStructures/BinaryTree"],
)
