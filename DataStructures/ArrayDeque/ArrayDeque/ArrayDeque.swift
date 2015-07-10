//
//  ArrayDeque.swift
//  ArrayDeque
//
//  Created by Rogelio Gudino on 7/9/15.
//  Copyright © 2015 Rogelio Gudino. All rights reserved.
//

public struct ArrayDeque<T> {
    // TODO: Copy on write (mutate), otherwise it'll be shared storage when copying
    private var storage = ArrayDequeStorage<T>()
    
    public init() {
    }
    
    public init(array: [T]) {
        self.storage = ArrayDequeStorage<T>(array: array)
    }
    
    public subscript (index: Int) -> T? {
        return storage[index]
    }
    
    public func count() -> Int {
        return storage.count
    }
    
    public func isEmpty() -> Bool {
        return storage.isEmpty()
    }
    
    public mutating func prependElement(element: T) {
        storage.prependElement(element)
    }
    
    public mutating func appendElement(element: T) {
        storage.appendElement(element)
    }
    
    public mutating func removeFirstElement() -> T? {
        return storage.removeFirstElement()
    }
    
    public mutating func removeLastElement() -> T? {
        return storage.removeLastElement()
    }
}

private class ArrayDequeStorage<T> {
    private var storage: UnsafeMutablePointer<T>
    private var startIndex = 0
    private var endIndex = 0
    private var space = 4
    private var count = 0
    
    private init() {
        storage = UnsafeMutablePointer<T>.alloc(space)
    }
    
    private init(array: [T]) {
        storage = UnsafeMutablePointer<T>.alloc(array.count)
        storage.initializeFrom(array)
        count = array.count
        space = count
        if count != 0 {
            endIndex = count - 1
        }
    }
    
    deinit {
        storage.destroy(space)
        storage.dealloc(space)
    }
    
    private subscript (index: Int) -> T? {
        if index > (count - 1) {
            return nil
        }
        return elementAtIndex(index)
    }
    
    private func isEmpty() -> Bool {
        return count == 0
    }
    
    private func prependElement(element: T) {
        expandStorageIfNecessary()
        
        if startIndex != 0 {
            startIndex--
            (storage + startIndex).initialize(element)
            count++
            return
        }
        
        let newStorage = UnsafeMutablePointer<T>.alloc(space)
        (newStorage + 0).initialize(element)
        for var index = 0; index < count; index++ {
            (newStorage + (index + 1)).initialize(elementAtIndex(index))
        }
        storage.dealloc(space)
        storage = newStorage
        startIndex = 0
        endIndex++
        count++
    }
    
    private func appendElement(element: T) {
        expandStorageIfNecessary()
        if isEmpty() == false {
            endIndex = (endIndex + 1) % space
            print(endIndex)
        }
        (storage + endIndex).initialize(element)
        count++
    }
    
    private func removeFirstElement() -> T? {
        if isEmpty() {
            return nil
        }
        
        let element = (storage + startIndex).move()
        startIndex++
        count--
        
        shrinkStorageIfNecessary()
        
        return element
    }
    
    private func removeLastElement() -> T? {
        if isEmpty() {
            return nil
        }
        
        let element = (storage + endIndex).move()
        if endIndex != 0 {
            endIndex--
        }
        count--
        
        shrinkStorageIfNecessary()
        
        return element
    }
    
    private func elementAtIndex(index: Int) -> T {
        let adjustedIndex = (index + startIndex) % space
        return (storage + adjustedIndex).memory
    }
    
    private func expandStorageIfNecessary() {
        if space <= count {
            adjustStorageToNewSpace(space * 2)
        }
    }
    
    private func shrinkStorageIfNecessary() {
        if (space / 4) >= count {
            adjustStorageToNewSpace(space / 2)
        }
    }
    
    private func adjustStorageToNewSpace(newSpace: Int) {
        let newStorage = UnsafeMutablePointer<T>.alloc(newSpace)
        
        for var index = 0; index < count; index++ {
            (newStorage + index).initialize(elementAtIndex(index))
        }
        
        storage.dealloc(space)
        storage = newStorage
        space = newSpace
        
        startIndex = 0
        if count == 0 {
            endIndex = 0
        } else {
            endIndex = count - 1
        }
    }
}
