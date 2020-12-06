// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Stack",
  products: [
    .library(
      name: "Stack",
      targets: ["Stack"]
    ),
  ],
  dependencies: [
    .package(path: "../ArrayDeque")
  ],
  targets: [
    .target(
      name: "Stack",
      dependencies: ["ArrayDeque"]
    ),
    .testTarget(
      name: "StackTests",
      dependencies: ["Stack"]
    ),
  ]
)
