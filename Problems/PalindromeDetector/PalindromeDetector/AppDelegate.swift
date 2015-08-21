//
//  AppDelegate.swift
//  PalindromeDetector
//
//  Created by Rogelio Gudino on 3/22/15.
//  Copyright (c) 2015 Rogelio Gudino. All rights reserved.
//

import Cocoa
import Stack
import LinkedList

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSTextFieldDelegate {
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var resultLabel: NSTextField!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        self.updateResultLabel()
    }
    
    override func controlTextDidChange(obj: NSNotification) {
        self.updateResultLabel()
    }
    
    private func updateResultLabel() {
        if self.textField.stringValue.isEmpty {
            self.resultLabel.stringValue = ""
        } else if self.textField.stringValue.lowercaseString.withoutWhiteSpaces().isPalindrome() {
            self.resultLabel.stringValue = "Yep"
        } else {
            self.resultLabel.stringValue = "Nope"
        }
    }
}

extension String {
    func withoutWhiteSpaces() -> String {
        return lazy(self.characters).filter { $0 != " " }.reduce("") { $0 + String($1) }
    }
    
    func isPalindrome() -> Bool {
        return isPalindromUsingIteration()
    }
    
    func isPalindromUsingIteration() -> Bool {
        let characters = Array(self.characters)
        var leftIndex = 0
        var rightIndex = characters.count - 1
        while leftIndex < rightIndex {
            if characters[leftIndex] != characters[rightIndex] {
                return false
            }
            leftIndex++
            rightIndex--
        }
        return true
    }
    
    func isPalindromeUsingRecursion() -> Bool {
        let length = self.characters.count
        
        if length == 0 || length == 1 {
            return true
        }
        
        let firstCharacter = self[advance(self.startIndex, 0)]
        let lastCharacter = self[advance(self.startIndex, length - 1)]
        let matchingEnds = firstCharacter == lastCharacter
        if matchingEnds && length == 2 {
            return true
        } else if matchingEnds {
            let secondCharacterStringIndex = advance(self.startIndex, 1)
            let secondToLastCharacterStringIndex = advance(self.startIndex, length - 2)
            let range = secondCharacterStringIndex...secondToLastCharacterStringIndex
            let newString = self[range]
            
            return newString.isPalindromeUsingRecursion()
        }
        
        return false
    }
    
    func isPalindromeUsingStack() -> Bool {
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
            index++
        }
        
        return true
    }
    
    func isPalindromeUsingLinkedList() -> Bool {
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
}
