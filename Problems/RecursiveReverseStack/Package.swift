// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "RecursiveReverseStack",
  products: [
    .library(
      name: "RecursiveReverseStack",
      targets: ["RecursiveReverseStack"]
    ),
  ],
  dependencies: [
    .package(path: "../../DataStructures/Stack")
  ],
  targets: [
    .target(
      name: "RecursiveReverseStack",
      dependencies: ["Stack"]
    ),
    .testTarget(
      name: "RecursiveReverseStackTests",
      dependencies: ["RecursiveReverseStack"]
    ),
  ]
)
