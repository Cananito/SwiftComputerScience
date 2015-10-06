//
//  ViewController.swift
//  StringPermutations
//
//  Created by Rogelio Gudino on 10/5/15.
//  Copyright © 2015 Rogelio Gudino. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
    @IBOutlet weak var stringTextField: NSTextField!
    @IBOutlet weak var permutationsTableView: NSTableView!
    @IBOutlet weak var permutationsCountLabel: NSTextField!
    @IBOutlet weak var generatePermutationsButton: NSButton!
    
    var permutations = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stringTextField.becomeFirstResponder()
    }
    
    // MARK: NSTableViewDataSource Methods
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return self.permutations.count
    }
    
    // MARK: NSTableViewDelegate Methods
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let permutation = self.permutations[row]
        
        let tableCellView = tableView.makeViewWithIdentifier("PermutationCell", owner: self) as? NSTableCellView
        tableCellView?.textField?.stringValue = permutation
        
        return tableCellView
    }
    
    func tableView(tableView: NSTableView, selectionIndexesForProposedSelection proposedSelectionIndexes: NSIndexSet) -> NSIndexSet {
        return NSIndexSet()
    }
    
    // MARK: Action Methods
    @IBAction func generatePermutations(sender: NSButton!) {
        permutations = stringTextField.stringValue.permutations()
        permutationsCountLabel.stringValue = "Permutations: \(permutations.count)"
        permutationsTableView.reloadData()
    }
}
