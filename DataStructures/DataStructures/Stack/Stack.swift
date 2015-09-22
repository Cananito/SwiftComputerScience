//
//  Stack.swift
//  Stack
//
//  Created by Rogelio Gudino on 7/20/14.
//  Copyright (c) 2014 Cananito. All rights reserved.
//

public struct Stack<T> {
    private var array = Array<T>()
    
    public init() {
    }
    
    public init(elements: [T]) {
        self.array = elements
    }
    
    public func count() -> Int {
        return self.array.count
    }
    
    public func peek() -> T? {
        return self.array.last
    }
    
    public mutating func push(object: T) {
        self.array.append(object)
    }
    
    public mutating func pop() -> T {
        return self.array.removeLast()
    }
}
