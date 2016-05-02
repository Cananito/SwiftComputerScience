//
//  String+Palindrome.swift
//  PalindromeDetector
//
//  Created by Rogelio Gudino on 5/1/16.
//  Copyright © 2016 Rogelio Gudino. All rights reserved.
//

import DataStructures

extension String {
    func withoutWhiteSpaces() -> String {
        return self.characters.lazy.filter { $0 != " " }.reduce("") { $0 + String($1) }
    }
    
    func isPalindrome() -> Bool {
        return isPalindromeUsingIteration()
    }
    
    func isPalindromeUsingIteration() -> Bool {
        if isEmptyOrSingleCharacter() {
            return true
        }
        
        let characters = Array(self.characters)
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
    
    func isPalindromeUsingRecursion() -> Bool {
        if isEmptyOrSingleCharacter() {
            return true
        }
        
        let length = self.characters.count
        let firstCharacter = self[self.startIndex.advancedBy(0)]
        let lastCharacter = self[self.startIndex.advancedBy(length - 1)]
        let matchingEnds = firstCharacter == lastCharacter
        if matchingEnds && length == 2 {
            return true
        } else if matchingEnds {
            let secondCharacterStringIndex = self.startIndex.advancedBy(1)
            let secondToLastCharacterStringIndex = self.startIndex.advancedBy(length - 2)
            let range = secondCharacterStringIndex...secondToLastCharacterStringIndex
            let newString = self[range]
            
            return newString.isPalindromeUsingRecursion()
        }
        
        return false
    }
    
    func isPalindromeUsingStack() -> Bool {
        if isEmptyOrSingleCharacter() {
            return true
        }
        
        let characters = Array(self.characters)
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
    
    func isPalindromeUsingLinkedList() -> Bool {
        if isEmptyOrSingleCharacter() {
            return true
        }
        
        let characters = Array(self.characters)
        let linkedList = LinkedList<Character>()
        
        for character in characters {
            linkedList.appendValue(character)
        }
        
        while (linkedList.lastNode != nil) {
            if linkedList.firstNode?.value != linkedList.lastNode?.value {
                return false
            }
            linkedList.detachFirstValue()
            linkedList.detachLastValue()
        }
        
        return true
    }
    
    func isPalindromeUsingArrayDeque() -> Bool {
        // TODO: Implement.
        // 1. Fill up the deque.
        // 2. Grab (remove) and compare first and last values.
        return false
    }
    
    // MARK: Private
    
    private func isEmptyOrSingleCharacter() -> Bool {
        return self.isEmpty || self.characters.count == 1
    }
}
