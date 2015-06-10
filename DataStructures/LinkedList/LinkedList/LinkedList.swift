//
//  LinkedList.swift
//  LinkedList
//
//  Created by Rogelio Gudino on 2/13/15.
//
//

public class LinkedList<T: CustomStringConvertible>: CustomStringConvertible {
    var headNode: LinkedListNode<T>?
    
    public init() {
    }
    
    // MARK: Printable Methods
    public var description: String {
        get {
            if let node = headNode {
                return node.description
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
