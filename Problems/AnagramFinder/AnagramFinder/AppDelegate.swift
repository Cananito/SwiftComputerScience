//
//  AppDelegate.swift
//  AnagramFinder
//
//  Created by Rogelio Gudino on 2/14/15.
//  Copyright (c) 2015 Rogelio Gudino. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate, NSTableViewDataSource, NSTableViewDelegate {
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var progressIndicator: NSProgressIndicator!
    @IBOutlet weak var populateWithEnglishDictionaryButton: NSButton!
    @IBOutlet weak var textScrollView: NSScrollView!
    @IBOutlet weak var findAnagramsButton: NSButton!
    @IBOutlet weak var anagramsTableViewScrollContainer: NSScrollView!
    @IBOutlet weak var anagramsTableView: NSTableView!
    private var textView: NSTextView! {
        get {
            return self.textScrollView.contentView.documentView as! NSTextView
        }
    }
    
    private var anagramCluster = [String: [String]]()
    private var sortedAnagramClusterKeys = [String]()
    private let privateQueue = DispatchQueue(label: "com.cananito.private-queue")
    
    // MARK: NSApplicationDelegate
    func applicationDidFinishLaunching(_ aNotification: Notification) {
    }
    
    // MARK: NSWindowDelegate
    func windowDidBecomeKey(_ notification: Notification) {
    }
    
    // MARK: NSTableViewDataSource Methods
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.sortedAnagramClusterKeys.count
    }
    
    // MARK: NSTableViewDelegate Methods
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let key = self.sortedAnagramClusterKeys[row]
        
        var numberOfOccurrences = 0
        if let words = self.anagramCluster[key] {
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
            
            self.privateQueue.async {
                let words = string.characters.split(whereSeparator: { $0 == "\n" }).map { String($0) }
                self.anagramCluster = clusterArrayOfWords(words)
                self.sortedAnagramClusterKeys = self.anagramCluster.keys.sorted()
                
                DispatchQueue.main.async {
                    self.hideLoadingUI()
                    self.anagramsTableView.reloadData()
                }
            }
        }
    }
    
    @IBAction func populateWithEnglishDictionary(_ sender: AnyObject!) {
        self.showLoadingUI()
        self.privateQueue.async {
            let wordsPath = "/bin/cat"
            let wordsString = outputStringFromLaunchPath(wordsPath, arguments: ["/usr/share/dict/words"])
            DispatchQueue.main.async {
                self.hideLoadingUI()
                self.textView.string = wordsString
            }
        }
    }
    
    // MARK: Private Methods
    private func showLoadingUI() {
        self.populateWithEnglishDictionaryButton.isEnabled = false
        self.findAnagramsButton.isEnabled = false
        
        self.textView.isSelectable = false
        self.textView.isEditable = false
        self.textView.alphaValue = 0.25
        
        self.anagramsTableView.isEnabled = false
        self.anagramsTableView.alphaValue = 0.25
        
        self.progressIndicator.startAnimation(self)
    }
    
    private func hideLoadingUI() {
        self.populateWithEnglishDictionaryButton.isEnabled = true
        self.findAnagramsButton.isEnabled = true
        
        self.textView.isSelectable = true
        self.textView.isEditable = true
        self.textView.alphaValue = 1.0
        
        self.anagramsTableView.isEnabled = true
        self.anagramsTableView.alphaValue = 1.0
        
        self.progressIndicator.stopAnimation(self)
    }
}
