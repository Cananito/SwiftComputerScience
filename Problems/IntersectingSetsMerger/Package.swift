// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "IntersectingSetsMerger",
  products: [
    .library(
      name: "IntersectingSetsMerger",
      targets: ["IntersectingSetsMerger"]
    ),
  ],
  targets: [
    .target(
      name: "IntersectingSetsMerger"
    ),
    .testTarget(
      name: "IntersectingSetsMergerTests",
      dependencies: ["IntersectingSetsMerger"]
    ),
  ]
)
