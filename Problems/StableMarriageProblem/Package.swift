// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "StableMarriageProblem",
  products: [
    .library(
      name: "StableMarriageProblem",
      targets: ["StableMarriageProblem"]
    ),
  ],
  targets: [
    .target(
      name: "StableMarriageProblem"
    ),
    .testTarget(
      name: "StableMarriageProblemTests",
      dependencies: ["StableMarriageProblem"]
    ),
  ]
)
