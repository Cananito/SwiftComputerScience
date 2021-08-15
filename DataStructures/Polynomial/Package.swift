// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Polynomial",
  products: [
    .library(
      name: "Polynomial",
      targets: ["Polynomial"]
    ),
  ],
  targets: [
    .target(
      name: "Polynomial",
      dependencies: []
    ),
    .testTarget(
      name: "PolynomialTests",
      dependencies: ["Polynomial"]
    ),
  ]
)