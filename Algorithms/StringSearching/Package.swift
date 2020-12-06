// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "StringSearching",
  products: [
    .library(
      name: "StringSearching",
      targets: ["StringSearching"]
    ),
  ],
  targets: [
    .target(
      name: "StringSearching",
      dependencies: []
    ),
    .testTarget(
      name: "StringSearchingTests",
      dependencies: ["StringSearching"]
    ),
  ]
)
