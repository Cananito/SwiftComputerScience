//
//  Stack.swift
//  CananitoSwift
//
//  Created by Rogelio Gudino on 7/20/14.
//  Copyright (c) 2014 Cananito. All rights reserved.
//

public class Stack<T> {
    private var objectsArray = Array<T>()
    
    public init() {
    }
    
    public func count() -> Int {
        return self.objectsArray.count
    }
    
    public func peekObject() -> T {
        return self.objectsArray[self.objectsArray.endIndex]
    }
    
    public func pushObject(object: T) {
        self.objectsArray.append(object)
    }
    
    public func popLastObject() -> T {
        return self.objectsArray.removeLast()
    }
}
