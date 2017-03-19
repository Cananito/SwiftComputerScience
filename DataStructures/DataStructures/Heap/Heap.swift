//
//  Heap.swift
//  DataStructures
//
//  Created by Rogelio Gudino on 3/18/17.
//  Copyright © 2017 Rogelio Gudino. All rights reserved.
//

public struct Heap<T: Comparable>: PriorityQueue {
    public typealias Element = T
    private let leftIsHigherPriority: (T, T) -> Bool
    private var storage = [T]()
    
    public init(leftIsHigherPriority: @escaping (T, T) -> Bool) {
        self.leftIsHigherPriority = leftIsHigherPriority
    }
    
    public func isEmpty() -> Bool {
        return storage.isEmpty
    }
    
    public func count() -> Int {
        return storage.count
    }
    
    public func peek() -> T? {
        return storage.first
    }
    
    public mutating func insert(element: T) {
        storage.append(element)
        updateStorageTreeViaInsert()
    }
    
    private mutating func updateStorageTreeViaInsert() {
        // Take the rightmost leaf (last element).
        let rightmostLeaf = storage.last!
        var currentIndex = storage.count - 1
        
        // Navigate up the tree and swap it with elements of lower priority.
        while currentIndex > 0 {
            // Obtain index of parent.
            let parentIndex: Int
            if currentIndex == 1 {
                parentIndex = 0
            } else {
                parentIndex = ((currentIndex + 1) / 2) - 1
            }
            
            // Compare with parent.
            let parent = storage[parentIndex]
            if leftIsHigherPriority(rightmostLeaf, parent) {
                storage[currentIndex] = parent
                storage[parentIndex] = rightmostLeaf
                currentIndex = parentIndex
                continue
            }
            
            // Lower priority than parent. We’re done.
            break
        }
        print("storage: \(storage)")
    }
    
    public mutating func remove() -> T? {
        if storage.isEmpty {
            return nil
        }
        let root = storage[0]
        updateStorageTreeViaRemove()
        return root
    }
    
    private mutating func updateStorageTreeViaRemove() {
        // Take the rightmost leaf (last element) and set it as the new root.
        let rightmostLeaf = storage.last!
        var currentIndex = 0
        storage[currentIndex] = rightmostLeaf
        storage.removeLast()
        
        // Navigate down the tree and swap it with elements of higher priority.
        while true {
            let rightChildIndex = (currentIndex + 1) * 2
            let leftChildIndex = rightChildIndex - 1
            
            if rightChildIndex < storage.count && leftChildIndex < storage.count {
                // Have both children, obtain the one with higher priority.
                let rightChild = storage[rightChildIndex]
                let leftChild = storage[leftChildIndex]
                let child: T
                let childIndex: Int
                if leftIsHigherPriority(leftChild, rightChild) {
                    child = leftChild
                    childIndex = leftChildIndex
                } else {
                    child = rightChild
                    childIndex = rightChildIndex
                }
                
                // Compare original rightmost leaf with higher priority child.
                if !leftIsHigherPriority(rightmostLeaf, child) {
                    storage[currentIndex] = child
                    storage[childIndex] = rightmostLeaf
                    currentIndex = childIndex
                    continue
                }
            } else if rightChildIndex < storage.count {
                // Compare original rightmost leaf with right child.
                let rightChild = storage[rightChildIndex]
                if !leftIsHigherPriority(rightmostLeaf, rightChild) {
                    storage[currentIndex] = rightChild
                    storage[rightChildIndex] = rightmostLeaf
                    currentIndex = rightChildIndex
                    continue
                }
            } else if leftChildIndex < storage.count {
                // Compare original rightmost leaf with left child.
                let leftChild = storage[leftChildIndex]
                if !leftIsHigherPriority(rightmostLeaf, leftChild) {
                    storage[currentIndex] = leftChild
                    storage[leftChildIndex] = rightmostLeaf
                    currentIndex = leftChildIndex
                    continue
                }
            }
            
            // Higher priority than both, or no children. We’re done.
            break
        }
        print("storage: \(storage)")
    }
}
