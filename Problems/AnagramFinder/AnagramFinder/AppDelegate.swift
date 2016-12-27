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
    
    // MARK: NSApplicationDelegate
    func applicationDidFinishLaunching(_ aNotification: Notification) {
    }
    
    // MARK: NSWindowDelegate
    func windowDidBecomeKey(_ notification: Notification) {
    }
    
    // MARK: NSTableViewDataSource Methods
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.currentClusterArray.keys.count
    }
    
    // MARK: NSTableViewDelegate Methods
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let index = self.currentClusterArray.index(self.currentClusterArray.startIndex, offsetBy: row)
        let key = self.currentClusterArray.keys[index]
        
        var numberOfOccurrences = 0
        if let words = self.currentClusterArray[key] {
            numberOfOccurrences = words.count
        }
        
        let tableCellView = tableView.make(withIdentifier: "AnagramCell", owner: self) as? NSTableCellView
        tableCellView?.textField?.stringValue = "\(key): \(numberOfOccurrences)"
        
        return tableCellView
    }
    
    func tableView(_ tableView: NSTableView, selectionIndexesForProposedSelection proposedSelectionIndexes: IndexSet) -> IndexSet {
        return IndexSet()
    }
    
    // MARK: Action Methods
    @IBAction func findAnagrams(_ sender: AnyObject!) {
        if let string = self.textView.string as String? {
            self.showLoadingUI()
            
            OperationQueue().addOperation { () -> Void in
                let words = string.characters.split(whereSeparator: { $0 == "\n" }).map { String($0) }
                self.currentClusterArray = clusterArrayOfWords(words)
                
                OperationQueue.main.addOperation({ () -> Void in
                    self.hideLoadingUI()
                    self.anagramsTableView.reloadData()
                })
            }
        }
    }
    
    // MARK: Private Methods
    private func showLoadingUI() {
        self.textScrollView.isHidden = true
        self.anagramsTableView.isHidden = true
        self.anagramsTableViewScrollContainer.isHidden = true
        self.findAnagramsButton.isEnabled = false
        self.progressIndicator.startAnimation(self)
    }
    
    private func hideLoadingUI() {
        self.textScrollView.isHidden = false
        self.anagramsTableView.isHidden = false
        self.anagramsTableViewScrollContainer.isHidden = false
        self.findAnagramsButton.isEnabled = true
        self.progressIndicator.stopAnimation(self)
    }
}
