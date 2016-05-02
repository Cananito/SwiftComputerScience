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
