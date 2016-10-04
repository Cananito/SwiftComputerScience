//
//  RLE.swift
//  RunLengthEncoding
//
//  Created by Rogelio Gudino on 11/2/15.
//  Copyright © 2015 Rogelio Gudino. All rights reserved.
//

// TODO: Make a full-fledged RLE struct:
// 1. Support generic values.
// 2. Make it a SequenceType.
// 3. Take care of data validation.
public typealias RLE = [Int]

enum RLEError: Error {
    case invalidRLE(message: String)
}

public struct RLEGenerator: IteratorProtocol {
    public typealias Element = Int
    
    private let rle: RLE
    private var currentIndex = Int(-2)
    private var currentCount = Int(0)
    
    public init(rle: RLE) throws {
        if rle.count % 2 != 0 {
            throw RLEError.invalidRLE(message: "Contents of RLE must be even, given count: \(rle.count).")
        }
        self.rle = rle
        advanceToNextNonZeroIfNecessary()
    }
    
    public func isAtEnd() -> Bool {
        if (currentCount == 0) && (currentIndex == (rle.count - 2)) {
            return true
        }
        return false
    }
    
    public mutating func next() -> Element? {
        if isAtEnd() {
            return nil
        }
        let element = rle[currentIndex + 1]
        currentCount -= 1
        advanceToNextNonZeroIfNecessary()
        return element
    }
    
    private mutating func advanceToNextNonZeroIfNecessary() {
        while currentCount == 0 {
            if isAtEnd() {
                return
            }
            currentIndex = currentIndex + 2
            currentCount = rle[currentIndex]
        }
    }
}
