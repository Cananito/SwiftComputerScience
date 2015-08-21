//
//  LinkedListNode.swift
//  LinkedList
//
//  Created by Rogelio Gudino on 2/13/15.
//
//

public class LinkedListNode<T> {
    public let value: T
    public var nextNode: LinkedListNode?
    
    init(value: T) {
        self.value = value
    }
}
