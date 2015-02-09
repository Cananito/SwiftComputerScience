//
//  FractalView.swift
//  SwiftFractals
//
//  Created by Rogelio Gudino on 8/2/14.
//  Copyright (c) 2014 Cananito. All rights reserved.
//

import Cocoa

class FractalView: NSView {
    private let colorsArray = [
        NSColor.greenColor(),
        NSColor.redColor(),
        NSColor.whiteColor(),
        NSColor.yellowColor(),
        NSColor.blueColor(),
        NSColor.brownColor(),
        NSColor.magentaColor(),
        NSColor.cyanColor(),
        NSColor.orangeColor(),
        NSColor.purpleColor()
    ]
    
    override func drawRect(dirtyRect: NSRect)  {
        self.drawFractal(dirtyRect)
    }
    
    internal func drawFractal(rect: NSRect) {
        println("Subclasses must override!")
    }
    
    internal func randomColor() -> NSColor {
        let index = Int(arc4random_uniform(UInt32(self.colorsArray.count)))
        let color = self.colorsArray[index]
        return color
    }
}
