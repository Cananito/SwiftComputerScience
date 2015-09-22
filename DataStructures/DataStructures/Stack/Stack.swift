//
//  Stack.swift
//  Stack
//
//  Created by Rogelio Gudino on 7/20/14.
//  Copyright (c) 2014 Cananito. All rights reserved.
//

public struct Stack<T> {
    private var storage = ArrayDeque<T>()
    private var reversed = false
    
    public init() {
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
    
    public mutating func push(object: T) {
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
