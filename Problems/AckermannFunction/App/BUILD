package(default_visibility = ["//visibility:private"])

load("@build_bazel_rules_apple//apple:macos.bzl", "macos_command_line_application")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

macos_command_line_application(
    name = "App",
    minimum_os_version = "10.13",
    deps = [":AppLib"],
)

swift_library(
    name = "AppLib",
    srcs = ["main.swift"],
    deps = ["//Problems/AckermannFunction"],
)
