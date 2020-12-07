// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Trie",
  products: [
    .library(
      name: "Trie",
      targets: ["Trie"]
    ),
  ],
  targets: [
    .target(
      name: "Trie",
      dependencies: []
    ),
    .testTarget(
      name: "TrieTests",
      dependencies: ["Trie"]
    ),
  ]
)
