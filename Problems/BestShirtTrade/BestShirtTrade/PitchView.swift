//
//  FieldView.swift
//  BestShirtTrade
//
//  Created by Rogelio Gudino on 3/21/15.
//  Copyright (c) 2015 Rogelio Gudino. All rights reserved.
//

import AppKit;

@IBDesignable class PitchView: NSView {
    private enum PitchSide {
        case left, right
    }
    
    private enum CornerPosition {
        case topLeft, topRight, bottomRight, bottomLeft
    }
    
    let backgroundColor = NSColor(calibratedRed: 0.0, green: 0.8, blue: 0.2, alpha: 1.0)
    let outlineColor = NSColor.white
    let strokeWidth = CGFloat(2.0)
    let pitchPadding = CGFloat(14.0)
    let spotDiameter = CGFloat(6.0)
    
    override func draw(_ dirtyRect: NSRect) {
        let context = NSGraphicsContext.current()?.cgContext
        if context == nil {
            return
        }
        
        context?.setFillColor(backgroundColor.cgColor)
        context?.fill(NSRectToCGRect(dirtyRect))
        
        context?.setFillColor(outlineColor.cgColor)
        context?.setStrokeColor(outlineColor.cgColor)
        context?.setLineWidth(strokeWidth)
        
        context?.stroke(touchAndGoalLinesRect(dirtyRect))
        context?.stroke(halfWayLineRect(dirtyRect))
        context?.fillEllipse(in: centreSpotRect(dirtyRect))
        context?.strokeEllipse(in: centreCircleRect(dirtyRect))
        
        context?.stroke(sixYardBoxRect(dirtyRect, side: .left))
        context?.stroke(sixYardBoxRect(dirtyRect, side: .right))
        
        context?.stroke(eightTeenYardBoxRect(dirtyRect, side: .left))
        context?.stroke(eightTeenYardBoxRect(dirtyRect, side: .right))
        
        context?.stroke(goalBoxRect(dirtyRect, side: .left))
        context?.stroke(goalBoxRect(dirtyRect, side: .right))
        
        context?.fillEllipse(in: penaltySpotRect(dirtyRect, side: .left))
        context?.fillEllipse(in: penaltySpotRect(dirtyRect, side: .right))
        
        context?.addPath(cornerArcPath(dirtyRect, cornerPosition: .topLeft))
        context?.strokePath()
        context?.addPath(cornerArcPath(dirtyRect, cornerPosition: .topRight))
        context?.strokePath()
        context?.addPath(cornerArcPath(dirtyRect, cornerPosition: .bottomRight))
        context?.strokePath()
        context?.addPath(cornerArcPath(dirtyRect, cornerPosition: .bottomLeft))
        context?.strokePath()
        
        context?.addPath(penaltyArcPath(dirtyRect, side: .left))
        context?.strokePath()
        context?.addPath(penaltyArcPath(dirtyRect, side: .right))
        context?.strokePath()
    }
    
    // MARK: Components
    
    private func touchAndGoalLinesRect(_ containerRect: NSRect) -> CGRect {
        return containerRect.insetBy(dx: pitchPadding, dy: pitchPadding)
    }
    
    private func halfWayLineRect(_ containerRect: NSRect) -> CGRect {
        let width = CGFloat(1.0)
        let x = (containerRect.width / 2.0) - (width / 2.0)
        let y = containerRect.minY + pitchPadding
        let middleLineHeight = containerRect.height - (pitchPadding * 2.0)
        let middleLineOriginPoint = CGPoint(x: x, y: y)
        let middleLineSize = CGSize(width: width, height: middleLineHeight)
        return CGRect(origin: middleLineOriginPoint, size: middleLineSize)
    }
    
    private func centreSpotRect(_ containerRect: NSRect) -> CGRect {
        return centeredCircleRect(containerRect, diameter: spotDiameter)
    }
    
    private func centreCircleRect(_ containerRect: NSRect) -> CGRect {
        let diameter = containerRect.width * 0.2
        return centeredCircleRect(containerRect, diameter: diameter)
    }
    
    private func sixYardBoxRect(_ containerRect: NSRect, side: PitchSide) -> CGRect {
        return boxRect(containerRect, side: side, widthMultiplier: 0.06, heightMultiplier: 0.2)
    }
    
    private func eightTeenYardBoxRect(_ containerRect: NSRect, side: PitchSide) -> CGRect {
        return boxRect(containerRect, side: side, widthMultiplier: 0.18, heightMultiplier: 0.44)
    }
    
    private func goalBoxRect(_ containerRect: NSRect, side: PitchSide) -> CGRect {
        return boxRect(containerRect, side: side, widthMultiplier: -0.01, heightMultiplier: 0.08)
    }
    
    private func penaltySpotRect(_ containerRect: NSRect, side: PitchSide) -> CGRect {
        let radius = spotDiameter / 2.0
        let distanceFromGoal = (containerRect.width * 0.12)
        let x: CGFloat
        switch side {
        case .left:
            x = pitchPadding + distanceFromGoal - radius
        case .right:
            x = containerRect.width - pitchPadding - distanceFromGoal - radius
        }
        
        var centeredRect = centeredCircleRect(containerRect, diameter: spotDiameter)
        centeredRect.origin.x = x
        return centeredRect
    }
    
    private func cornerArcPath(_ containerRect: NSRect, cornerPosition: CornerPosition) -> CGPath {
        let diameter = containerRect.width * 0.02
        let radius = diameter / 2.0
        let x: CGFloat
        let y: CGFloat
        let startAngle: CGFloat
        
        let path = CGMutablePath()
        switch cornerPosition {
        case .topLeft:
            x = containerRect.minX + pitchPadding
            y = containerRect.maxY - pitchPadding
            startAngle = CGFloat(Double.pi * 1.5)
        case .topRight:
            x = containerRect.maxX - pitchPadding
            y = containerRect.maxY - pitchPadding
            startAngle = CGFloat(Double.pi * 1.0)
        case .bottomRight:
            x = containerRect.maxX - pitchPadding
            y = containerRect.minY + pitchPadding
            startAngle = CGFloat(Double.pi * 0.5)
        case .bottomLeft:
            x = containerRect.minX + pitchPadding
            y = containerRect.minY + pitchPadding
            startAngle = CGFloat(Double.pi * 2.0)
        }
        let endAngle = startAngle + CGFloat(Double.pi * 0.5)
        let center = CGPoint(x: x, y: y)
        
        path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        return path
    }
    
    private func penaltyArcPath(_ containerRect: NSRect, side: PitchSide) -> CGPath {
        let spotRect = penaltySpotRect(containerRect, side: side)
        let center = CGPoint(x: spotRect.midX, y: spotRect.midY)
        let diameter = containerRect.width * 0.2
        let radius = diameter / 2.0
        
        let path = CGMutablePath()
        switch side {
        case .left:
            path.addArc(center: center, radius: radius, startAngle: 1.0, endAngle: -1.0, clockwise: true)
        case .right:
            path.addArc(center: center, radius: radius, startAngle: CGFloat(1.0 + Double.pi), endAngle: CGFloat(-1.0 + Double.pi), clockwise: true)
        }
        return path
    }
    
    // MARK: Reused
    
    private func boxRect(_ containerRect: NSRect, side: PitchSide, widthMultiplier: CGFloat, heightMultiplier: CGFloat) -> CGRect {
        let width = (containerRect.width - (pitchPadding * 2.0)) * widthMultiplier
        let height = (containerRect.height - (pitchPadding * 2.0)) * heightMultiplier
        let y = (containerRect.height / 2.0) - (height / 2.0)
        let x: CGFloat
        switch side {
        case .left:
            x = pitchPadding
        case .right:
            x = containerRect.width - pitchPadding - width
        }
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    private func centeredCircleRect(_ containerRect: NSRect, diameter: CGFloat) -> CGRect {
        let radius = diameter / 2.0
        let x = (containerRect.width / 2.0) - radius
        let y = (containerRect.height / 2.0) - radius
        return CGRect(x: x, y: y, width: diameter, height: diameter)
    }
}
