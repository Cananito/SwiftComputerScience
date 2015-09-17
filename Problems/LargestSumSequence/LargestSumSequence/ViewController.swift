//
//  ViewController.swift
//  LargestSumSequence
//
//  Created by Rogelio Gudino on 8/22/15.
//  Copyright © 2015 Rogelio Gudino. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var currentArrayLabel: NSTextField!
    @IBOutlet weak var resultArrayLabel: NSTextField!
    @IBOutlet weak var resultSumLabel: NSTextField!
    @IBOutlet weak var numberTextField: NSTextField!
    @IBOutlet weak var appendButton: NSButton!
    @IBOutlet weak var calculateButton: NSButton!
    
    var currentArray = [Int]()
    var resultArray = [Int]()
    
    @IBAction func appendButtonWasClicked(sender: AnyObject!) {
        if let number = Int(numberTextField.stringValue) {
            currentArray.append(number)
            updateUI()
        }
    }
    
    @IBAction func calculateButtonWasClicked(sender: AnyObject!) {
        resultArray = largestSumSequence(currentArray)
        updateUI()
    }
    
    @IBAction func clearButtonWasClicked(sender: AnyObject!) {
        currentArray.removeAll()
        resultArray.removeAll()
        numberTextField.stringValue = "0"
        updateUI()
    }
    
    override func controlTextDidChange(obj: NSNotification) {
        if let _ = Int(numberTextField.stringValue) {
            appendButton.enabled = true
            calculateButton.enabled = true
        } else {
            appendButton.enabled = false
            calculateButton.enabled = false
        }
    }
    
    private func updateUI() {
        currentArrayLabel.stringValue = currentArray.description
        resultArrayLabel.stringValue = resultArray.description
        resultSumLabel.stringValue = String(resultArray.reduce(0) { $0 + $1 })
    }
}
