//
//  LinkedList.swift
//  LinkedList
//
//  Created by Rogelio Gudino on 2/13/15.
//
//

public class LinkedList<T>: CustomStringConvertible, CustomDebugStringConvertible {
    public var firstNode: LinkedListNode<T>?
    public var lastNode: LinkedListNode<T>?
    
    public init() {
    }
    
    // MARK: Public Methods
    public func appendValue(value: T) {
        let newNode = LinkedListNode(value: value)
        newNode.previousNode = self.lastNode
        self.lastNode?.nextNode = newNode
        self.lastNode = newNode
        if self.firstNode == nil {
            self.firstNode = newNode
        }
    }
    
    public func prependValue(value: T) {
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
