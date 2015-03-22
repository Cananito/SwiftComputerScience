//
//  Queue.swift
//  Queue
//
//  Created by Rogelio Gudino on 7/20/14.
//  Copyright (c) 2014 Cananito. All rights reserved.
//

public class Queue<T> {
    private var objectsArray = Array<T>()
    
    public init() {
    }
    
    public func count() -> Int {
        return self.objectsArray.count
    }
    
    public func peekObject() -> T {
        return self.objectsArray[0]
    }
    
    public func enqueueObject(object: T) {
        self.objectsArray.append(object)
    }
    
    public func dequeueObject() -> T {
        let object: T = self.objectsArray[0]
        self.objectsArray.removeAtIndex(0)
        return object
    }
}
