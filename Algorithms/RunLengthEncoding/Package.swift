// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "RunLengthEncoding",
  products: [
    .library(
      name: "RunLengthEncoding",
      targets: ["RunLengthEncoding"]
    ),
  ],
  targets: [
    .target(
      name: "RunLengthEncoding",
      dependencies: []
    ),
    .testTarget(
      name: "RunLengthEncodingTests",
      dependencies: ["RunLengthEncoding"]
    ),
  ]
)
