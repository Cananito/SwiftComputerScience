// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "ExpiringDictionary",
  products: [
    .library(
      name: "ExpiringDictionary",
      targets: ["ExpiringDictionary"]
    ),
  ],
  dependencies: [
    .package(path: "../Heap")
  ],
  targets: [
    .target(
      name: "ExpiringDictionary",
      dependencies: ["Heap"]
    ),
    .testTarget(
      name: "ExpiringDictionaryTests",
      dependencies: ["ExpiringDictionary"]
    ),
  ]
)
