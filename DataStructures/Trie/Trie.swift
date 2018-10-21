//
//  Trie.swift
//  DataStructures
//
//  Created by Rogelio Gudino on 10/4/15.
//  Copyright © 2017 Rogelio Gudino. All rights reserved.
//

public struct Trie<T> {
    public typealias Key = String
    
    private var rootNode = TrieNode<T>(key: nil, value: nil)
    
    public init() {
    }

    public func valueForKey(_ key: Key) -> T? {
        if key.isEmpty {
            return nil
        }
        
        var currentNode = rootNode
        for (_, character) in key.enumerated() {
            if let node = currentNode.childNodeWithKey(character) {
                currentNode = node
            } else {
                return nil
            }
        }
        
        return currentNode.value
    }
    
    public mutating func setValue(_ value: T, key: Key) {
        if key.isEmpty {
            return
        }
        
        var currentNode = rootNode
        for (_, character) in key.enumerated() {
            if let node = currentNode.childNodeWithKey(character) {
                currentNode = node
            } else {
                currentNode = currentNode.addChildNodeWithKey(character)
            }
        }
        
        currentNode.value = value
    }
    
    public mutating func removeValueForKey(_ key: Key) -> T? {
        if key.isEmpty {
            return nil
        }
        
        var currentNode = rootNode
        for (_, character) in key.enumerated() {
            if let node = currentNode.childNodeWithKey(character) {
                currentNode = node
            } else {
                return nil
            }
        }
        
        let value = currentNode.value
        currentNode.value = nil
        currentNode.trim()
        return value
    }
}
