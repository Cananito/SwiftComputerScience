//
//  LinkedListNode.swift
//  LinkedList
//
//  Created by Rogelio Gudino on 2/13/15.
//
//

public class LinkedListNode<T: Printable>: Printable {
    let value: T
    var nextNode: LinkedListNode?
    
    init(value: T) {
        self.value = value
    }
    
    // MARK: Printable
    public var description: String {
        get {
            if let node = nextNode {
                return value.description + " -> " + node.description
            }
            return value.description
        }
    }
}
