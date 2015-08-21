//
//  LinkedListNode.swift
//  LinkedList
//
//  Created by Rogelio Gudino on 2/13/15.
//
//

public class LinkedListNode<T: CustomDebugStringConvertible>: CustomDebugStringConvertible {
    let value: T
    var nextNode: LinkedListNode?
    
    init(value: T) {
        self.value = value
    }
    
    // MARK: CustomDebugStringConvertible
    public var debugDescription: String {
        get {
            if let node = nextNode {
                return value.debugDescription + " -> " + node.debugDescription
            }
            return value.debugDescription
        }
    }
}
