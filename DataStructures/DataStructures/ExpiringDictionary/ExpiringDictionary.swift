//
//  ExpiringDictionary.swift
//  DataStructures
//
//  Created by Rogelio Gudino on 11/25/17.
//  Copyright © 2017 Rogelio Gudino. All rights reserved.
//

import Foundation

public struct ExpiringDictionary<Key: Hashable, Value> {
    private struct ValueTimeInterval {
        let value: Value
        let expirationTimeInterval: TimeInterval
    }

    private struct KeyTimeInterval : Comparable {
        static func <(lhs: KeyTimeInterval, rhs: KeyTimeInterval) -> Bool {
            return lhs.expirationTimeInterval < rhs.expirationTimeInterval
        }
        static func ==(lhs: KeyTimeInterval, rhs: KeyTimeInterval) -> Bool {
            return lhs.expirationTimeInterval == rhs.expirationTimeInterval
        }
        let key: Key
        let expirationTimeInterval: TimeInterval
    }
    
    private var valueTimeIntervals = Dictionary<Key, ValueTimeInterval>();
    private var keyTimeIntervalHeap = Heap<KeyTimeInterval>(leftIsHigherPriority: <)
    
    public func count() -> Int {
        return valueTimeIntervals.count
    }
    
    public mutating func insert(key: Key, value: Value, expirationTimeInterval: TimeInterval) {
        // Always updating and inserting to get proper clean-up via `cleanUp()`. Otherwise if invalid time intervals are skipped, the heap will become stale with outdated entries.
        
        valueTimeIntervals[key] = ValueTimeInterval(value: value, expirationTimeInterval: expirationTimeInterval)
        // Heap will have possible duplicate keys. `cleanUp()` accounts for this.
        keyTimeIntervalHeap.insert(element: KeyTimeInterval(key: key, expirationTimeInterval: expirationTimeInterval))
        cleanUp()
    }
    
    public mutating func value(forKey key: Key) -> Value? {
        // return valueWithoutCleanUp(forKey: key)
        return valueWithCleanUp(forKey: key)
    }
    
    private mutating func valueWithCleanUp(forKey key: Key) -> Value? {
        cleanUp()
        return valueTimeIntervals[key]?.value
    }
    
    private mutating func valueWithoutCleanUp(forKey key: Key) -> Value? {
        guard let entry = valueTimeIntervals[key] else {
            return nil
        }
        if entry.expirationTimeInterval < Date().timeIntervalSince1970 {
            valueTimeIntervals.removeValue(forKey: key)
            return nil
        }
        return entry.value
    }
    
    private mutating func cleanUp() {
        let currentTimeInterval = Date().timeIntervalSince1970
        while let keyTimeInterval = keyTimeIntervalHeap.peek() {
            if keyTimeInterval.expirationTimeInterval >= currentTimeInterval {
                // Earliest entry hasn’t expired, rest are also still be valid.
                return
            }
            
            // Clean-up otherwise.
            _ = keyTimeIntervalHeap.remove()
            let key = keyTimeInterval.key
            if let valueTimeInterval = valueTimeIntervals[key], valueTimeInterval.expirationTimeInterval == keyTimeInterval.expirationTimeInterval {
                valueTimeIntervals.removeValue(forKey: key)
            } // Otherwise the entry got updated in the `valueTimeIntervals` dictionary during insert and thus the heap ended with duplicates.
        }
    }
}
