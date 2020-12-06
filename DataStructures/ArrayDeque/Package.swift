// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "ArrayDeque",
  products: [
    .library(
      name: "ArrayDeque",
      targets: ["ArrayDeque"]
    ),
  ],
  targets: [
    .target(
      name: "ArrayDeque",
      dependencies: []
    ),
    .testTarget(
      name: "ArrayDequeTests",
      dependencies: ["ArrayDeque"]
    ),
  ]
)
