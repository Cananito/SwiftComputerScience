//
//  BinaryTree.swift
//  DataStructures
//
//  Created by Rogelio Gudino on 9/6/15.
//  Copyright © 2017 Rogelio Gudino. All rights reserved.
//

public class BinaryTreeNode<T>: CustomStringConvertible, CustomDebugStringConvertible {
    public let value: T
    public var leftNode: BinaryTreeNode?
    public var rightNode: BinaryTreeNode?
    public weak var parentNode: BinaryTreeNode?
    
    public init(value: T) {
        self.value = value
    }
    
    public func enumerate(body: (BinaryTreeNode) -> ()) {
        enumerateInOrder(body)
    }
    
    public func enumerateInOrder(body: (BinaryTreeNode) -> ()) {
        if let leftNode = self.leftNode {
            leftNode.enumerateInOrder(body)
        }
        body(self)
        if let rightNode = self.rightNode {
            rightNode.enumerateInOrder(body)
        }
    }
    
    public func enumeratePreOrder(body: (BinaryTreeNode) -> ()) {
        body(self)
        if let leftNode = self.leftNode {
            leftNode.enumeratePreOrder(body)
        }
        if let rightNode = self.rightNode {
            rightNode.enumeratePreOrder(body)
        }
    }
    
    public func enumeratePostOrder(body: (BinaryTreeNode) -> ()) {
        if let leftNode = self.leftNode {
            leftNode.enumeratePostOrder(body)
        }
        if let rightNode = self.rightNode {
            rightNode.enumeratePostOrder(body)
        }
        body(self)
    }
    
    public func enumerateBreadthFirst(body: (BinaryTreeNode) -> ()) {
        var queue = [BinaryTreeNode]()
        queue.append(self)
        
        while queue.isEmpty == false {
            let current = queue.first!
            if let left = current.leftNode {
                queue.append(left)
            }
            if let right = current.rightNode {
                queue.append(right)
            }
            body(current)
            queue.removeFirst()
        }
    }
    
    public func next() -> BinaryTreeNode? {
        var nextLeft = self.rightNode
        while nextLeft != nil {
            if let n = nextLeft?.leftNode {
                nextLeft = n
            } else {
                return nextLeft
            }
        }
        
        var currentNode = self
        while currentNode.parentNode != nil {
            let parent = currentNode.parentNode!
            if let left = parent.leftNode where left === currentNode {
                return parent
            }
            currentNode = parent
        }
        
        return nil
    }
    
    // MARK: CustomStringConvertible
    
    public var description: String {
        return "\(self.value)"
    }
    
    // MARK: CustomDebugStringConvertible
    
    public var debugDescription: String {
        return "\(self.value)"
    }
}
