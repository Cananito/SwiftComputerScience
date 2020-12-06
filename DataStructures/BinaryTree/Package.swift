// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "BinaryTree",
  products: [
    .library(
      name: "BinaryTree",
      targets: ["BinaryTree"]
    ),
  ],
  targets: [
    .target(
      name: "BinaryTree",
      dependencies: []
    ),
    .testTarget(
      name: "BinaryTreeTests",
      dependencies: ["BinaryTree"],
      exclude: [
        "BinaryTreeNextNodeSample.graffle",
      ]
    ),
  ]
)
