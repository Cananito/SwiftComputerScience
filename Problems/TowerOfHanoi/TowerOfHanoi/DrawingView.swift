//
//  DrawingView.swift
//  SwiftTowerOfHanoi
//
//  Created by Rogelio Gudino on 8/3/14.
//  Copyright (c) 2014 Cananito. All rights reserved.
//

import Cocoa

class DrawingView: NSView {
    private var firstPoleRect: NSRect
    private var secondPoleRect: NSRect
    private var thirdPoleRect: NSRect
    private var diskWidths: [CGFloat]
    var towerOfHanoi: TowerOfHanoi = TowerOfHanoi() {
    didSet {
        self.display()
    }
    }
    
    override init(frame frameRect: NSRect) {
        self.firstPoleRect = NSRect()
        self.secondPoleRect = NSRect()
        self.thirdPoleRect = NSRect()
        self.diskWidths = [CGFloat]()
        super.init(frame: frameRect)
    }
    
    required init?(coder: NSCoder) {
        self.firstPoleRect = NSRect()
        self.secondPoleRect = NSRect()
        self.thirdPoleRect = NSRect()
        self.diskWidths = [CGFloat]()
        super.init(coder: coder)
    }
    
    override func draw(_ dirtyRect: NSRect) {
        self.drawPoles(dirtyRect)
        self.drawDisks()
    }
    
    private func drawPoles(_ rect: NSRect) {
        let combinedPolesWidth = rect.size.width / 2
        let poleWidth = combinedPolesWidth / 3
        var poleRect = NSRect(x: 0, y: rect.origin.y, width: poleWidth, height: rect.size.height)
        
        poleRect.origin.x = poleWidth / 2.0
        self.firstPoleRect = poleRect
        poleRect.origin.x = self.firstPoleRect.maxX + poleWidth
        self.secondPoleRect = poleRect
        poleRect.origin.x = self.secondPoleRect.maxX + poleWidth;
        self.thirdPoleRect = poleRect
        
        self.populateDiskWidths()
        
        self.drawPole(self.firstPoleRect)
        self.drawPole(self.secondPoleRect)
        self.drawPole(self.thirdPoleRect)
    }
    
    private func populateDiskWidths() {
        self.diskWidths.removeAll(keepingCapacity: true)
        
        if self.towerOfHanoi.totalDiskCount() == 0 {
            return
        }
        
        let smallestDiskWidth = self.firstPoleRect.size.width * 0.10
        let diskWidthDecrements = (self.firstPoleRect.size.width - smallestDiskWidth) / CGFloat(self.towerOfHanoi.totalDiskCount())
        var currentWidth = self.firstPoleRect.size.width
        
        for _ in 0 ..< self.towerOfHanoi.totalDiskCount() {
            self.diskWidths.append(currentWidth)
            currentWidth -= diskWidthDecrements
        }
    }
    
    private func drawPole(_ rect: NSRect) {
        let poleBaseHeight = rect.size.height * 0.05
        let poleBaseRect = NSRect(x: rect.origin.x, y: rect.origin.y, width: rect.size.width, height: poleBaseHeight)
        self.drawSquare(poleBaseRect, withFillColor: NSColor.black, andStrokeColor: NSColor.clear)
        
        let polePoleWidth = rect.size.width * 0.10
        let polePoleHieght = rect.size.height - poleBaseHeight
        let polePoleX = rect.origin.x + (rect.size.width / 2) - (polePoleWidth / 2)
        let polePoleRect = NSRect(x: polePoleX, y: rect.origin.y, width: polePoleWidth, height: polePoleHieght)
        self.drawSquare(polePoleRect, withFillColor: NSColor.black, andStrokeColor: NSColor.clear)
    }
    
    private func drawDisks() {
        if self.towerOfHanoi.totalDiskCount() == 0 {
            return
        }
        
        let reverseFirstPoleDisks = self.towerOfHanoi.sourcePole.reversed()
        let reverseSecondPoleDisks = self.towerOfHanoi.destinationPole.reversed()
        let reverseThirdPoleDisks = self.towerOfHanoi.temporaryPole.reversed()
        
        self.drawPoleDisks(disks: reverseFirstPoleDisks, forPoleRect: self.firstPoleRect)
        self.drawPoleDisks(disks: reverseSecondPoleDisks, forPoleRect: self.secondPoleRect)
        self.drawPoleDisks(disks: reverseThirdPoleDisks, forPoleRect: self.thirdPoleRect)
    }
    
    private func drawPoleDisks<S: Sequence>(disks: S, forPoleRect poleRect: NSRect) where S.Iterator.Element == Disk {
        let diskHeight = poleRect.size.height * 0.05
        let diskVerticalPadding: CGFloat = 2.0
        var currentY = poleRect.origin.y + diskHeight + diskVerticalPadding
        
        for disk in disks {
            let currentWidth = self.diskWidths[disk.identifier - 1]
            let diskX = poleRect.origin.x + (poleRect.size.width / 2) - (currentWidth / 2)
            let diskRect = NSRect(x: diskX, y: currentY, width: currentWidth, height: diskHeight)
            self.drawSquare(diskRect, withFillColor: NSColor.red, andStrokeColor: NSColor.black)
            currentY += diskHeight + diskVerticalPadding
            
        }
    }
    
    private func drawSquare(_ rect: NSRect, withFillColor fillColor: NSColor, andStrokeColor strokeColor: NSColor) {
        let squarePath: NSBezierPath = NSBezierPath(rect: rect)
        squarePath.lineWidth = 1.0
        fillColor.set()
        squarePath.fill()
        strokeColor.set()
        squarePath.stroke()
    }
}
