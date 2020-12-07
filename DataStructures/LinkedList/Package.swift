// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "LinkedList",
  products: [
    .library(
      name: "LinkedList",
      targets: ["LinkedList"]
    ),
  ],
  targets: [
    .target(
      name: "LinkedList",
      dependencies: []
    ),
    .testTarget(
      name: "LinkedListTests",
      dependencies: ["LinkedList"]
    ),
  ]
)
