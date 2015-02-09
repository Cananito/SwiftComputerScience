//
//  MondrianFractalView.swift
//  SwiftFractals
//
//  Created by Rogelio Gudino on 8/2/14.
//  Copyright (c) 2014 Cananito. All rights reserved.
//

import Cocoa

enum MondrianSquareSequence: Int {
    case SplitHorizontal, SplitVertical, Nothing
}

class MondrianFractalView: FractalView {
    override func drawFractal(rect: NSRect) {
        let width = CGRectGetWidth(rect)
        let height = CGRectGetHeight(rect)
        
        if (width < 20.0 || height < 20.0) {
            return
        }
        
        self.drawSquare(rect)
        
        let sequence = MondrianSquareSequence(rawValue: Int(arc4random_uniform(UInt32(3))))
        if let mondrianSequence = sequence? {
            switch mondrianSequence {
            case .SplitHorizontal:
                self.splitHorizontal(rect)
            case .SplitVertical:
                self.splitVertical(rect)
            case .Nothing:
                break
            default:
                break
            }
        }
    }
    
    private func splitHorizontal(rect: NSRect) {
        let newY = self.newValueForRectLength(rect.size.height)
        let topRect = NSRect(x: rect.origin.x, y: rect.origin.y, width: rect.size.width, height: newY)
        let bottomRect = NSRect(x: rect.origin.x, y: rect.origin.y + newY, width: rect.size.width, height: rect.size.height - newY)
        self.drawFractal(topRect)
        self.drawFractal(bottomRect)
    }
    
    private func splitVertical(rect: NSRect) {
        let newX = self.newValueForRectLength(rect.size.width)
        let leftRect = NSRect(x: rect.origin.x, y: rect.origin.y, width: newX, height: rect.size.height)
        let rightRect = NSRect(x: rect.origin.x + newX, y: rect.origin.y, width: rect.size.width - newX, height: rect.size.height)
        self.drawFractal(leftRect)
        self.drawFractal(rightRect)
    }
    
    private func newValueForRectLength(length: CGFloat) -> CGFloat {
        let value = Float(arc4random_uniform(UInt32(length)))
        return CGFloat(value)
    }
    
    private func drawSquare(rect: NSRect) {
        let squarePath: NSBezierPath = NSBezierPath(rect: rect)
        self.randomColor().set()
        squarePath.fill()
        NSColor.blackColor().set()
        squarePath.stroke()
    }
}
