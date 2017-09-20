//
//  PlotView.swift
//  TuppersSelfReferentialFormula
//
//  Created by Rogelio Gudino on 9/3/17.
//  Copyright © 2017 Rogelio Gudino. All rights reserved.
//

import AppKit

public class PlotView : NSView {
    public override func draw(_ dirtyRect: NSRect) {
        let context = NSGraphicsContext.current()?.cgContext
        if context == nil {
            return
        }
        let color = NSColor.white.cgColor
        context?.setFillColor(color)
        context?.fill(dirtyRect)
    }
}
