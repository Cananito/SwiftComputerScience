//
//  FieldView.swift
//  BestShirtTrade
//
//  Created by Rogelio Gudino on 3/21/15.
//  Copyright (c) 2015 Rogelio Gudino. All rights reserved.
//

import AppKit;

@IBDesignable class FieldView: NSView {
    private enum PitchSide {
        case Left, Right
    }
    
    private enum CornerPosition {
        case TopLeft, TopRight, BottomRight, BottomLeft
    }
    
    let backgroundColor = NSColor(calibratedRed: 0.0, green: 0.8, blue: 0.2, alpha: 1.0)
    let outlineColor = NSColor.whiteColor()
    let strokeWidth = CGFloat(2.0)
    let pitchPadding = CGFloat(14.0)
    let spotDiameter = CGFloat(6.0)
    
    override func drawRect(dirtyRect: NSRect) {
        let context = NSGraphicsContext.currentContext()?.CGContext
        if context == nil {
            return
        }
        
        CGContextSetFillColorWithColor(context, backgroundColor.CGColor)
        CGContextFillRect(context, NSRectToCGRect(dirtyRect))
        
        CGContextSetFillColorWithColor(context, outlineColor.CGColor)
        CGContextSetStrokeColorWithColor(context, outlineColor.CGColor)
        CGContextSetLineWidth(context, strokeWidth)
        
        CGContextStrokeRect(context, touchAndGoalLinesRect(dirtyRect))
        CGContextStrokeRect(context, halfWayLineRect(dirtyRect))
        CGContextFillEllipseInRect(context, centreSpotRect(dirtyRect))
        CGContextStrokeEllipseInRect(context, centreCircleRect(dirtyRect))
        
        CGContextStrokeRect(context, sixYardBoxRect(dirtyRect, side: .Left))
        CGContextStrokeRect(context, sixYardBoxRect(dirtyRect, side: .Right))
        
        CGContextStrokeRect(context, eightTeenYardBoxRect(dirtyRect, side: .Left))
        CGContextStrokeRect(context, eightTeenYardBoxRect(dirtyRect, side: .Right))
        
        CGContextStrokeRect(context, goalBoxRect(dirtyRect, side: .Left))
        CGContextStrokeRect(context, goalBoxRect(dirtyRect, side: .Right))
        
        CGContextFillEllipseInRect(context, penaltySpotRect(dirtyRect, side: .Left))
        CGContextFillEllipseInRect(context, penaltySpotRect(dirtyRect, side: .Right))
        
        CGContextAddPath(context, cornerArcPath(dirtyRect, cornerPosition: .TopLeft))
        CGContextStrokePath(context)
        CGContextAddPath(context, cornerArcPath(dirtyRect, cornerPosition: .TopRight))
        CGContextStrokePath(context)
        CGContextAddPath(context, cornerArcPath(dirtyRect, cornerPosition: .BottomRight))
        CGContextStrokePath(context)
        CGContextAddPath(context, cornerArcPath(dirtyRect, cornerPosition: .BottomLeft))
        CGContextStrokePath(context)
        
        CGContextAddPath(context, penaltyArcPath(dirtyRect, side: .Left))
        CGContextStrokePath(context)
        CGContextAddPath(context, penaltyArcPath(dirtyRect, side: .Right))
        CGContextStrokePath(context)
    }
    
    // MARK: Components
    
    private func touchAndGoalLinesRect(containerRect: NSRect) -> CGRect {
        return CGRectInset(containerRect, pitchPadding, pitchPadding)
    }
    
    private func halfWayLineRect(containerRect: NSRect) -> CGRect {
        let width = CGFloat(1.0)
        let x = (CGRectGetWidth(containerRect) / 2.0) - (width / 2.0)
        let y = CGRectGetMinY(containerRect) + pitchPadding
        let middleLineHeight = CGRectGetHeight(containerRect) - (pitchPadding * 2.0)
        let middleLineOriginPoint = CGPoint(x: x, y: y)
        let middleLineSize = CGSize(width: width, height: middleLineHeight)
        return CGRect(origin: middleLineOriginPoint, size: middleLineSize)
    }
    
    private func centreSpotRect(containerRect: NSRect) -> CGRect {
        return centeredCircleRect(containerRect, diameter: spotDiameter)
    }
    
    private func centreCircleRect(containerRect: NSRect) -> CGRect {
        let diameter = CGRectGetWidth(containerRect) * 0.2
        return centeredCircleRect(containerRect, diameter: diameter)
    }
    
    private func sixYardBoxRect(containerRect: NSRect, side: PitchSide) -> CGRect {
        return boxRect(containerRect, side: side, widthMultiplier: 0.06, heightMultiplier: 0.2)
    }
    
    private func eightTeenYardBoxRect(containerRect: NSRect, side: PitchSide) -> CGRect {
        return boxRect(containerRect, side: side, widthMultiplier: 0.18, heightMultiplier: 0.44)
    }
    
    private func goalBoxRect(containerRect: NSRect, side: PitchSide) -> CGRect {
        return boxRect(containerRect, side: side, widthMultiplier: -0.01, heightMultiplier: 0.08)
    }
    
    private func penaltySpotRect(containerRect: NSRect, side: PitchSide) -> CGRect {
        let radius = spotDiameter / 2.0
        let distanceFromGoal = (CGRectGetWidth(containerRect) * 0.12)
        let x: CGFloat
        switch side {
        case .Left:
            x = pitchPadding + distanceFromGoal - radius
        case .Right:
            x = CGRectGetWidth(containerRect) - pitchPadding - distanceFromGoal - radius
        }
        
        var centeredRect = centeredCircleRect(containerRect, diameter: spotDiameter)
        centeredRect.origin.x = x
        return centeredRect
    }
    
    private func cornerArcPath(containerRect: NSRect, cornerPosition: CornerPosition) -> CGPathRef {
        let diameter = CGRectGetWidth(containerRect) * 0.02
        let radius = diameter / 2.0
        let x: CGFloat
        let y: CGFloat
        let startAngle: CGFloat
        
        let path = CGPathCreateMutable()
        switch cornerPosition {
        case .TopLeft:
            x = CGRectGetMinX(containerRect) + pitchPadding
            y = CGRectGetMaxY(containerRect) - pitchPadding
            startAngle = CGFloat(M_PI) + CGFloat(M_PI / 2.0)
        case .TopRight:
            x = CGRectGetMaxX(containerRect) - pitchPadding
            y = CGRectGetMaxY(containerRect) - pitchPadding
            startAngle = CGFloat(M_PI)
        case .BottomRight:
            x = CGRectGetMaxX(containerRect) - pitchPadding
            y = CGRectGetMinY(containerRect) + pitchPadding
            startAngle = CGFloat(M_PI / 2.0)
        case .BottomLeft:
            x = CGRectGetMinX(containerRect) + pitchPadding
            y = CGRectGetMinY(containerRect) + pitchPadding
            startAngle = 0.0
        }
        
        let endAngle = startAngle + CGFloat(M_PI / 2.0)
        CGPathAddArc(path, nil, x, y, radius, startAngle, endAngle, false)
        return path
    }
    
    private func penaltyArcPath(containerRect: NSRect, side: PitchSide) -> CGPathRef {
        let spotRect = penaltySpotRect(containerRect, side: side)
        let centerX = CGRectGetMidX(spotRect)
        let centerY = CGRectGetMidY(spotRect)
        let diameter = CGRectGetWidth(containerRect) * 0.2
        let radius = diameter / 2.0
        
        let path = CGPathCreateMutable()
        switch side {
        case .Left:
            CGPathAddArc(path, nil, centerX, centerY, radius, 1.0, -1.0, true)
        case .Right:
            let startAngle = CGFloat(1.0 + M_PI)
            let endAngle = CGFloat(-1.0 + M_PI)
            CGPathAddArc(path, nil, centerX, centerY, radius, startAngle, endAngle, true)
        }
        return path
    }
    
    // MARK: Reused
    
    private func boxRect(containerRect: NSRect, side: PitchSide, widthMultiplier: CGFloat, heightMultiplier: CGFloat) -> CGRect {
        let width = (CGRectGetWidth(containerRect) - (pitchPadding * 2.0)) * widthMultiplier
        let height = (CGRectGetHeight(containerRect) - (pitchPadding * 2.0)) * heightMultiplier
        let y = (CGRectGetHeight(containerRect) / 2.0) - (height / 2.0)
        let x: CGFloat
        switch side {
        case .Left:
            x = pitchPadding
        case .Right:
            x = CGRectGetWidth(containerRect) - pitchPadding - width
        }
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    private func centeredCircleRect(containerRect: NSRect, diameter: CGFloat) -> CGRect {
        let radius = diameter / 2.0
        let x = (CGRectGetWidth(containerRect) / 2.0) - radius
        let y = (CGRectGetHeight(containerRect) / 2.0) - radius
        return CGRect(x: x, y: y, width: diameter, height: diameter)
    }
}
