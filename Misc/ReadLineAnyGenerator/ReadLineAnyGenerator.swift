//
//  ReadLineAnyGenerator.swift
//  ReadLineAnyGenerator
//
//  Created by Rogelio Gudino on 7/16/16.
//  Copyright © 2016 Rogelio Gudino. All rights reserved.
//

// https://twitter.com/kametrixom/status/739960738794594309
print("Type 3 lines:")

let g = AnyIterator {
    readLine()
}

//let threeLines = Array(g.prefix(3))
//print("First 3 lines:\n\(threeLines)")

let a = Array(g.prefix(3))
for (i, l) in a.enumerated() {
    print("\(i + 1) - \(l)")
}
