//
//  TriangleFractalView.swift
//  SwiftFractals
//
//  Created by Rogelio Gudino on 8/2/14.
//  Copyright (c) 2014 Cananito. All rights reserved.
//

import Cocoa

class TriangleFractalView: FractalView {
    override func drawFractal(rect: NSRect) {
        self.drawTriangle(rect)
        
        let width = CGRectGetWidth(rect)
        let height = CGRectGetHeight(rect)
        
        if (width < 20.0 || height < 20.0) {
            return
        }
        
        let halfWidth = width / 2
        let halfHeight = height / 2
        
        let topY = rect.origin.y + halfHeight
        let bottomY = rect.origin.y
        let middleX = rect.origin.x + (halfWidth / 2)
        let rightX = rect.origin.x + halfWidth
        let leftX = rect.origin.x
        
        let topMiddleRect = NSRect(x: middleX, y: topY, width: halfWidth, height: halfHeight)
        let bottomRightRect = NSRect(x: rightX, y: bottomY, width: halfWidth, height: halfHeight)
        let bottomLeftRect = NSRect(x: leftX, y: bottomY, width: halfWidth, height: halfHeight)
        
        drawFractal(topMiddleRect)
        drawFractal(bottomRightRect)
        drawFractal(bottomLeftRect)
    }
    
    private func drawTriangle(rect: NSRect) {
        let topY = rect.origin.y + CGRectGetHeight(rect)
        let bottomY = rect.origin.y
        let middleX = rect.origin.x + (CGRectGetWidth(rect) / 2)
        let rightX = rect.origin.x + CGRectGetWidth(rect)
        let leftX = rect.origin.x
        
        let topMiddlePoint: NSPoint = NSPoint(x: middleX, y: topY)
        let bottomRightPoint: NSPoint = NSPoint(x: rightX, y: bottomY)
        let bottomLeftPoint: NSPoint = NSPoint(x: leftX, y: bottomY)
        
        self.randomColor().set()
        let trianglePath: NSBezierPath = NSBezierPath()
        trianglePath.moveToPoint(topMiddlePoint)
        trianglePath.lineToPoint(bottomRightPoint)
        trianglePath.lineToPoint(bottomLeftPoint)
        trianglePath.lineToPoint(topMiddlePoint)
        trianglePath.lineWidth = 2.0
        trianglePath.stroke()
    }
}
