// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Queue",
  products: [
    .library(
      name: "Queue",
      targets: ["Queue"]
    ),
  ],
  targets: [
    .target(
      name: "Queue",
      dependencies: []
    ),
    .testTarget(
      name: "QueueTests",
      dependencies: ["Queue"]
    ),
  ]
)
