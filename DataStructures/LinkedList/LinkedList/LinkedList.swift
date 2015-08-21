//
//  LinkedList.swift
//  LinkedList
//
//  Created by Rogelio Gudino on 2/13/15.
//
//

public class LinkedList<T: CustomDebugStringConvertible>: CustomDebugStringConvertible {
    var headNode: LinkedListNode<T>?
    
    public init() {
    }
    
    // MARK: CustomDebugStringConvertible
    public var debugDescription: String {
        get {
            if let node = headNode {
                return node.debugDescription
            }
            return ""
        }
    }
    
    // MARK: Public Methods
    public func prependValue(value: T) {
        let newNode = LinkedListNode(value: value)
        if let headNode = self.headNode {
            newNode.nextNode = headNode
        }
        self.headNode = newNode
    }
}
