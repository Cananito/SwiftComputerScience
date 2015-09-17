//
//  LinkedListNode.swift
//  LinkedList
//
//  Created by Rogelio Gudino on 2/13/15.
//
//

public class LinkedListNode<T>: CustomStringConvertible, CustomDebugStringConvertible {
    public let value: T
    public var nextNode: LinkedListNode?
    public var previousNode: LinkedListNode?
    
    init(value: T) {
        self.value = value
    }
    
    // MARK: CustomStringConvertible
    public var description: String {
        if let nextNode = self.nextNode {
            return "\(self.value) -> \(nextNode.description)"
        }
        return "\(self.value)"
    }
    
    // MARK: CustomDebugStringConvertible
    public var debugDescription: String {
        if let nextNode = self.nextNode {
            return "\(self.value) -> \(nextNode.debugDescription)"
        }
        return "\(self.value)"
    }
}
