// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Heap",
  products: [
    .library(
      name: "Heap",
      targets: ["Heap"]
    ),
  ],
  dependencies: [
    .package(path: "../PriorityQueue")
  ],
  targets: [
    .target(
      name: "Heap",
      dependencies: ["PriorityQueue"]
    ),
    .testTarget(
      name: "HeapTests",
      dependencies: ["Heap"]
    ),
  ]
)
