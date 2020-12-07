// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "StringReverse",
  products: [
    .library(
      name: "StringReverse",
      targets: ["StringReverse"]
    ),
  ],
  dependencies: [
    .package(path: "../../DataStructures/Stack")
  ],
  targets: [
    .target(
      name: "StringReverse",
      dependencies: ["Stack"]
    ),
    .testTarget(
      name: "StringReverseTests",
      dependencies: ["StringReverse"]
    ),
  ]
)
