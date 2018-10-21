//
//  String+PalindromeDetector.swift
//  PalindromeDetector
//
//  Created by Rogelio Gudino on 5/1/16.
//  Copyright © 2016 Rogelio Gudino. All rights reserved.
//

import DataStructures_LinkedList_LinkedList
import DataStructures_Stack_Stack

public extension String {
    public func withoutWhiteSpaces() -> String {
        return self.lazy.filter { $0 != " " }.reduce("") { $0 + String($1) }
    }
    
    public func isPalindrome() -> Bool {
        return isPalindromeUsingIteration()
    }
    
    public func isPalindromeUsingIteration() -> Bool {
        if isEmptyOrSingleCharacter() {
            return true
        }
        
        let characters = Array(self)
        var leftIndex = 0
        var rightIndex = characters.count - 1
        while leftIndex < rightIndex {
            if characters[leftIndex] != characters[rightIndex] {
                return false
            }
            leftIndex += 1
            rightIndex -= 1
        }
        return true
    }
    
    public func isPalindromeUsingRecursion() -> Bool {
        if isEmptyOrSingleCharacter() {
            return true
        }
        
        let length = self.count
        let firstCharacter = self[self.index(self.startIndex, offsetBy: 0)]
        let lastCharacter = self[self.index(self.startIndex, offsetBy: length - 1)]
        let matchingEnds = firstCharacter == lastCharacter
        if matchingEnds && length == 2 {
            return true
        } else if matchingEnds {
            let secondCharacterStringIndex = self.index(self.startIndex, offsetBy: 1)
            let secondToLastCharacterStringIndex = self.index(self.startIndex, offsetBy: length - 2)
            let range = secondCharacterStringIndex...secondToLastCharacterStringIndex
            let newString = String(self[range])
            
            return newString.isPalindromeUsingRecursion()
        }
        
        return false
    }
    
    public func isPalindromeUsingStack() -> Bool {
        if isEmptyOrSingleCharacter() {
            return true
        }
        
        let characters = Array(self)
        var stack = Stack(elements: characters)
        
        let middleIndex: Int
        if characters.count % 2 == 0 {
            middleIndex = (characters.count / 2) - 1
        } else {
            middleIndex = characters.count / 2
        }
        
        var index = 0
        while index < characters.count {
            if stack.pop() != characters[index] {
                return false
            }
            if index == middleIndex {
                return true
            }
            index += 1
        }
        
        return true
    }
    
    public func isPalindromeUsingLinkedList() -> Bool {
        if isEmptyOrSingleCharacter() {
            return true
        }
        
        let characters = Array(self)
        let linkedList = LinkedList<Character>()
        
        for character in characters {
            linkedList.appendValue(character)
        }
        
        while (linkedList.lastNode != nil) {
            if linkedList.firstNode?.value != linkedList.lastNode?.value {
                return false
            }
            _ = linkedList.detachFirstValue()
            _ = linkedList.detachLastValue()
        }
        
        return true
    }
    
    public func isPalindromeUsingArrayDeque() -> Bool {
        // TODO: Implement.
        // 1. Fill up the deque.
        // 2. Grab (remove) and compare first and last values.
        return false
    }
    
    // MARK: Private
    
    private func isEmptyOrSingleCharacter() -> Bool {
        return self.isEmpty || self.count == 1
    }
}
