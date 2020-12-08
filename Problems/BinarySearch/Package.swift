// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "BinarySearch",
  products: [
    .library(
      name: "BinarySearch",
      targets: ["BinarySearch"]
    ),
  ],
  targets: [
    .target(
      name: "BinarySearch"
    ),
    .testTarget(
      name: "BinarySearchTests",
      dependencies: ["BinarySearch"]
    ),
  ]
)
