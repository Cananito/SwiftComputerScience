//
//  ViewController.swift
//  TuppersSelfReferentialFormula
//
//  Created by Rogelio Gudino on 8/6/15.
//  Copyright © 2015 Rogelio Gudino. All rights reserved.
//

import Cocoa

// https://en.wikipedia.org/wiki/Tupper%27s_self-referential_formula
// https://www.youtube.com/watch?v=_s5RFgd59ao

class ViewController: NSViewController {
    @IBOutlet private var numberLabel: NSTextField?
    @IBOutlet private var plotView: PlotView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel?.stringValue = "\(LLONG_MAX)"
    }
}
