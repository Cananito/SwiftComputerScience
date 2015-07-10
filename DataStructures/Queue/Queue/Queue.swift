//
//  Queue.swift
//  Queue
//
//  Created by Rogelio Gudino on 7/20/14.
//  Copyright (c) 2014 Cananito. All rights reserved.
//

public struct Queue<T> {
    private var array = [T]()
    
    public init() {
    }
    
    public init(elements: [T]) {
        self.array = elements
    }
    
    public func count() -> Int {
        return self.array.count
    }
    
    public func peek() -> T {
        return self.array[0]
    }
    
    public mutating func add(element: T) {
        self.array.append(element)
    }
    
    public mutating func next() -> T? {
        if self.array.count < 1 {
            return nil
        }
        let element = array.removeAtIndex(0)
        return element
    }
}
