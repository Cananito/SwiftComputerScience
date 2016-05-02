//
//  ArrayDeque.swift
//  ArrayDeque
//
//  Created by Rogelio Gudino on 7/9/15.
//  Copyright © 2015 Rogelio Gudino. All rights reserved.
//

public struct ArrayDeque<T> {
    private var storage: ArrayDequeStorage<T>
    
    public init() {
        self.storage = ArrayDequeStorage()
    }
    
    public init(array: [T]) {
        self.storage = ArrayDequeStorage(array: array)
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
    
    public func last() -> T? {
        let index = count() - 1
        return storage[index]
    }
    
    public mutating func prepend(element: T) {
        makeCopyOfStorageReferenceIfNecessary()
        storage.prepend(element)
    }
    
    public mutating func append(element: T) {
        makeCopyOfStorageReferenceIfNecessary()
        storage.append(element)
    }
    
    public mutating func removeFirst() -> T? {
        makeCopyOfStorageReferenceIfNecessary()
        return storage.removeFirst()
    }
    
    public mutating func removeLast() -> T? {
        makeCopyOfStorageReferenceIfNecessary()
        return storage.removeLast()
    }
    
    private mutating func makeCopyOfStorageReferenceIfNecessary() {
        if isUniquelyReferencedNonObjC(&storage) == false {
            storage = ArrayDequeStorage<T>(arrayDequeStorage: storage)
        }
    }
}

private class ArrayDequeStorage<T> {
    private var storage: UnsafeMutablePointer<T>
    private var startIndex = 0
    private var endIndex = 0
    private var capacity = 4
    private var count = 0
    
    private init() {
        storage = UnsafeMutablePointer<T>.alloc(capacity)
    }
    
    private init(array: [T]) {
        storage = UnsafeMutablePointer<T>.alloc(array.count)
        storage.initializeFrom(array)
        count = array.count
        capacity = count
        if count != 0 {
            endIndex = count - 1
        }
    }
    
    private init(arrayDequeStorage: ArrayDequeStorage<T>) {
        storage = UnsafeMutablePointer<T>.alloc(arrayDequeStorage.count)
        storage.initializeFrom(arrayDequeStorage.storage, count: arrayDequeStorage.count)
        startIndex = arrayDequeStorage.startIndex
        endIndex = arrayDequeStorage.endIndex
        capacity = arrayDequeStorage.capacity
        count = arrayDequeStorage.count
    }
    
    deinit {
        storage.destroy(capacity)
        storage.dealloc(capacity)
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
    
    private func prepend(element: T) {
        expandStorageIfNecessary()
        decrementStartIndex()
        (storage + startIndex).initialize(element)
        count++
    }
    
    private func append(element: T) {
        expandStorageIfNecessary()
        if isEmpty() == false {
            incrementEndIndex()
        }
        (storage + endIndex).initialize(element)
        count++
    }
    
    private func removeFirst() -> T? {
        if isEmpty() {
            return nil
        }
        
        let element = (storage + startIndex).move()
        count--
        incrementStartIndex()
        
        shrinkStorageIfNecessary()
        
        return element
    }
    
    private func removeLast() -> T? {
        if isEmpty() {
            return nil
        }
        
        let element = (storage + endIndex).move()
        count--
        decrementEndIndex()
        
        shrinkStorageIfNecessary()
        
        return element
    }
    
    private func elementAtIndex(index: Int) -> T {
        let adjustedIndex = (index + startIndex) % capacity
        return (storage + adjustedIndex).memory
    }
    
    private func incrementStartIndex() {
        let shouldMatchOtherIndex = isEmpty() && endIndex == startIndex
        
        startIndex = (startIndex + 1) % capacity
        
        if shouldMatchOtherIndex {
            endIndex = startIndex
        }
    }
    
    private func decrementStartIndex() {
        let shouldMatchOtherIndex = isEmpty() && endIndex == startIndex
        
        if startIndex == 0 {
            startIndex = capacity - 1
        } else {
            startIndex--
        }
        
        if shouldMatchOtherIndex {
            endIndex = startIndex
        }
    }
    
    private func incrementEndIndex() {
        let shouldMatchOtherIndex = isEmpty() && startIndex == endIndex
        
        endIndex = (endIndex + 1) % capacity
        
        if shouldMatchOtherIndex {
            startIndex = endIndex
        }
    }
    
    private func decrementEndIndex() {
        let shouldMatchOtherIndex = isEmpty() && startIndex == endIndex
        
        if endIndex == 0 {
            endIndex = capacity - 1
        } else {
            endIndex--
        }
        
        if shouldMatchOtherIndex {
            startIndex = endIndex
        }
    }
    
    private func expandStorageIfNecessary() {
        if capacity <= count {
            adjustStorageToNewCapacity(capacity * 2)
        }
    }
    
    private func shrinkStorageIfNecessary() {
        if (capacity / 4) >= count {
            adjustStorageToNewCapacity(capacity / 2)
        }
    }
    
    private func adjustStorageToNewCapacity(newCapacity: Int) {
        let newStorage = UnsafeMutablePointer<T>.alloc(newCapacity)
        
        for var index = 0; index < count; index++ {
            (newStorage + index).initialize(elementAtIndex(index))
        }
        
        storage.dealloc(capacity)
        storage = newStorage
        capacity = newCapacity
        
        startIndex = 0
        if count == 0 {
            endIndex = 0
        } else {
            endIndex = count - 1
        }
    }
}
