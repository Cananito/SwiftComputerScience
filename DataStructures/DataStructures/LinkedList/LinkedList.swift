//
//  LinkedList.swift
//  DataStructures
//
//  Created by Rogelio Gudino on 2/13/15.
//  Copyright © 2017 Rogelio Gudino. All rights reserved.
//

public class LinkedList<T: Hashable>: CustomStringConvertible, CustomDebugStringConvertible {
    public var firstNode: LinkedListNode<T>?
    public var lastNode: LinkedListNode<T>?
    
    public init() {
    }
    
    // MARK: Public Methods
    public func appendValue(_ value: T) {
        let newNode = LinkedListNode(value: value)
        newNode.previousNode = self.lastNode
        self.lastNode?.nextNode = newNode
        self.lastNode = newNode
        if self.firstNode == nil {
            self.firstNode = newNode
        }
    }
    
    public func prependValue(_ value: T) {
        let newNode = LinkedListNode(value: value)
        newNode.nextNode = self.firstNode
        self.firstNode?.previousNode = newNode
        self.firstNode = newNode
        if self.lastNode == nil {
            self.lastNode = newNode
        }
    }
    
    public func detachFirstValue() -> T? {
        let oldFirstNode = self.firstNode
        
        if let newFirstNode = oldFirstNode?.nextNode {
            self.firstNode = newFirstNode
            self.firstNode?.previousNode = nil
        } else {
            self.firstNode = nil
            self.lastNode = nil
        }
        
        oldFirstNode?.nextNode = nil
        return oldFirstNode?.value
    }
    
    public func detachLastValue() -> T? {
        let oldLastNode = self.lastNode
        
        if let newLastNode = oldLastNode?.previousNode {
            self.lastNode = newLastNode
            self.lastNode?.nextNode = nil
        } else {
            self.firstNode = nil
            self.lastNode = nil
        }
        
        oldLastNode?.previousNode = nil
        return oldLastNode?.value
    }
    
    public func deleteDuplicates() {
        deleteDuplicatesWithLinearTime()
    }
    
    public func deleteDuplicatesWithConstantMemory() {
        var current: LinkedListNode? = self.firstNode
        while current != nil {
            var temp: LinkedListNode? = current?.nextNode
            while temp != nil {
                if (current?.value == temp?.value) {
                    if temp === self.lastNode {
                        self.lastNode = temp?.previousNode
                        self.lastNode?.previousNode = temp?.previousNode?.previousNode
                    }
                    temp?.previousNode?.nextNode = temp?.nextNode
                    temp?.nextNode?.previousNode = temp?.previousNode
                    temp?.nextNode = nil
                    temp?.previousNode = nil
                    temp = temp?.previousNode?.nextNode
                } else {
                    temp = temp?.nextNode
                }
            }
            current = current?.nextNode
        }
    }
    
    public func deleteDuplicatesWithLinearTime() {
        var current: LinkedListNode? = self.firstNode
        var previous: LinkedListNode<T>?
        var set = Set<T>()
        while current != nil {
            if set.contains(current!.value) {
                if current === self.lastNode {
                    self.lastNode = current?.previousNode
                    self.lastNode?.previousNode = current?.previousNode?.previousNode
                }
                previous?.nextNode = current?.nextNode
                previous?.nextNode?.previousNode = previous
            } else {
                set.insert(current!.value)
                previous = current
            }
            current = current?.nextNode
        }
    }
    
    // MARK: CustomStringConvertible
    public var description: String {
        if let firstNode = self.firstNode {
            return firstNode.description
        }
        return ""
    }
    
    // MARK: CustomDebugStringConvertible
    public var debugDescription: String {
        if let firstNode = self.firstNode {
            return firstNode.debugDescription
        }
        return ""
    }
}
