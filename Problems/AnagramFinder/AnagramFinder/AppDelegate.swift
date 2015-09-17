//
//  AppDelegate.swift
//  AnagramFinder
//
//  Created by Rogelio Gudino on 2/14/15.
//  Copyright (c) 2015 Rogelio Gudino. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSTableViewDataSource, NSTableViewDelegate {
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var progressIndicator: NSProgressIndicator!
    @IBOutlet weak var textScrollView: NSScrollView!
    @IBOutlet weak var findAnagramsButton: NSButton!
    @IBOutlet weak var anagramsTableViewScrollContainer: NSScrollView!
    @IBOutlet weak var anagramsTableView: NSTableView!
    var textView: NSTextView! {
        get {
            return self.textScrollView.contentView.documentView as! NSTextView
        }
    }
    var currentClusterArray = [String: [String]]()
    
    // MARK: Action Methods
    @IBAction func findAnagrams(sender: AnyObject!) {
        if let string = self.textView.string as String? {
            self.showLoadingUI()
            
            NSOperationQueue().addOperationWithBlock { () -> Void in
                let words = string.characters.split(isSeparator: { $0 == "\n" }).map { String($0) }
                self.currentClusterArray = clusterArrayOfWords(words)
                
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    self.hideLoadingUI()
                    self.anagramsTableView.reloadData()
                })
            }
        }
    }
    
    // MARK: NSTableViewDataSource Methods
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return self.currentClusterArray.keys.count
    }
    
    // MARK: NSTableViewDelegate Methods
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let index = self.currentClusterArray.startIndex.advancedBy(row)
        let key = self.currentClusterArray.keys[index]
        
        var numberOfOccurrences = 0
        if let words = self.currentClusterArray[key] {
            numberOfOccurrences = words.count
        }
        
        let tableCellView = tableView.makeViewWithIdentifier("AnagramCell", owner: self) as? NSTableCellView
        tableCellView?.textField?.stringValue = "\(key): \(numberOfOccurrences)"
        
        return tableCellView
    }
    
    func tableView(tableView: NSTableView, selectionIndexesForProposedSelection proposedSelectionIndexes: NSIndexSet) -> NSIndexSet {
        return NSIndexSet()
    }
    
    // MARK: Private Methods
    private func showLoadingUI() {
        self.textScrollView.hidden = true
        self.anagramsTableView.hidden = true
        self.anagramsTableViewScrollContainer.hidden = true
        self.findAnagramsButton.enabled = false
        self.progressIndicator.startAnimation(self)
    }
    
    private func hideLoadingUI() {
        self.textScrollView.hidden = false
        self.anagramsTableView.hidden = false
        self.anagramsTableViewScrollContainer.hidden = false
        self.findAnagramsButton.enabled = true
        self.progressIndicator.stopAnimation(self)
    }
}
