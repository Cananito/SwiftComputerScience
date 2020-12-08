// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Fibonacci",
  products: [
    .library(
      name: "Fibonacci",
      targets: ["Fibonacci"]
    ),
  ],
  targets: [
    .target(
      name: "Fibonacci"
    ),
    .testTarget(
      name: "FibonacciTests",
      dependencies: ["Fibonacci"]
    ),
  ]
)
