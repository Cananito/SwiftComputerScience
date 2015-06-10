//
//  AppDelegate.swift
//  PalindromeDetector
//
//  Created by Rogelio Gudino on 3/22/15.
//  Copyright (c) 2015 Rogelio Gudino. All rights reserved.
//

import Cocoa

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
    func isPalindrome() -> Bool {
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
            
            return newString.isPalindrome()
        }
        
        return false
    }
    
    func withoutWhiteSpaces() -> String {
        return self.characters.filter { $0 != " " }.reduce("") { $0 + String($1) }
//        return self.characters.filter { $0 != " " }.reduce("") { $0 + [ $1 ] }
    }
}
