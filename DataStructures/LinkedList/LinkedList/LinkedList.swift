//
//  LinkedList.swift
//  LinkedList
//
//  Created by Rogelio Gudino on 2/13/15.
//
//

public class LinkedList<T> {
    public var firstNode: LinkedListNode<T>?
    public var lastNode: LinkedListNode<T>?
    
    public init() {
    }
    
    // MARK: Public Methods
    public func appendValue(value: T) {
        let newNode = LinkedListNode(value: value)
        self.lastNode?.nextNode = newNode
        self.lastNode = newNode
        if self.firstNode == nil {
            self.firstNode = newNode
        }
    }
    
    public func prependValue(value: T) {
        let newNode = LinkedListNode(value: value)
        newNode.nextNode = self.firstNode
        self.firstNode = newNode
        if self.lastNode == nil {
            self.lastNode = newNode
        }
    }
}
