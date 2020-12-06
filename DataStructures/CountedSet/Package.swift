// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "CountedSet",
  products: [
    .library(
      name: "CountedSet",
      targets: ["CountedSet"]
    ),
  ],
  targets: [
    .target(
      name: "CountedSet",
      dependencies: []
    ),
    .testTarget(
      name: "CountedSetTests",
      dependencies: ["CountedSet"]
    ),
  ]
)
