//
//  Stack.swift
//  DataStructures
//
//  Created by Rogelio Gudino on 7/20/14.
//  Copyright © 2017 Rogelio Gudino. All rights reserved.
//

import DataStructures_ArrayDeque_ArrayDeque

public struct Stack<T> {
    private var storage: ArrayDeque<T>
    private var reversed = false
    
    public init() {
        storage = ArrayDeque()
    }
    
    public init(elements: [T]) {
        storage = ArrayDeque(array: elements)
    }
    
    public func count() -> Int {
        return storage.count()
    }
    
    public func peek() -> T? {
        if reversed {
            return storage[0]
        }
        return storage.last()
    }
    
    public mutating func push(_ object: T) {
        if reversed {
            storage.prepend(object)
        } else {
            storage.append(object)
        }
    }
    
    public mutating func pop() -> T? {
        if reversed {
            return storage.removeFirst()
        }
        return storage.removeLast()
    }
    
    public mutating func reverse() {
        reversed = !reversed
    }
}
