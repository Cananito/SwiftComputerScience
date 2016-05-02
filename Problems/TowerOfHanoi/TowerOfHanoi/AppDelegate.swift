//
//  AppDelegate.swift
//  TowerOfHanoi
//
//  Created by Rogelio Gudino on 2/8/15.
//  Copyright (c) 2015 Rogelio Gudino. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var drawingView: DrawingView!
    @IBOutlet weak var actionButton: NSButton!
    private let originalDisksArray: [Disk]
    private let backgroundOperationQueue: NSOperationQueue
    
    override init() {
        var disks = [Disk]()
        for i in 1 ..< 6 {
            let disk = Disk(identifier: i)
            disks.append(disk)
        }
        self.originalDisksArray = Array(disks.reverse())
        self.backgroundOperationQueue = NSOperationQueue()
    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        self.resetTower()
    }
    
    @IBAction func buttonWasClicked(sender: AnyObject!) {
        guard let cell: NSCell = sender.selectedCell() else { return }
        if cell.title == "Solve" {
            cell.title = "Finish"
            self.resetTower()
            self.solveTower(animated: true)
        } else if cell.title == "Finish" {
            self.backgroundOperationQueue.cancelAllOperations()
            self.resetTower()
            self.solveTower(animated: false)
            cell.title = "Solve"
        }
    }
    
    private func resetTower() {
        var towerOfHanoi = TowerOfHanoi()
        towerOfHanoi.sourcePole = self.originalDisksArray
        self.drawingView.towerOfHanoi = towerOfHanoi
    }
    
    private func solveTower(animated animated: Bool) {
        var newTowerOfHanoi = self.drawingView.towerOfHanoi
        
        if animated {
            self.backgroundOperationQueue.addOperationWithBlock({
                NSThread.sleepForTimeInterval(0.4)
                self.moveAnimatedTower(tower: &newTowerOfHanoi, numberOfDisks: newTowerOfHanoi.sourcePole.count, sourcePole: &newTowerOfHanoi.sourcePole, destinationPole: &newTowerOfHanoi.destinationPole, temporaryPole: &newTowerOfHanoi.temporaryPole)
            })
        } else {
            self.moveTower(tower: &newTowerOfHanoi, numberOfDisks: newTowerOfHanoi.sourcePole.count, sourcePole: &newTowerOfHanoi.sourcePole, destinationPole: &newTowerOfHanoi.destinationPole, temporaryPole: &newTowerOfHanoi.temporaryPole)
            self.drawingView.towerOfHanoi = newTowerOfHanoi
        }
    }
    
    private func moveSingleDisk(inout sourcePole sourcePole: [Disk], inout destinationPole: [Disk]) {
        let disk = sourcePole.removeAtIndex(0)
        destinationPole.insert(disk, atIndex: 0)
    }
    
    private func moveAnimatedTower(inout tower tower: TowerOfHanoi, numberOfDisks: Int, inout sourcePole: [Disk], inout destinationPole: [Disk], inout temporaryPole: [Disk]) {
        if (numberOfDisks > 0) {
            self.moveAnimatedTower(tower: &tower, numberOfDisks: numberOfDisks - 1, sourcePole: &sourcePole, destinationPole: &temporaryPole, temporaryPole: &destinationPole)
            self.moveSingleDisk(sourcePole: &sourcePole, destinationPole: &destinationPole)
            
            if self.isCurrentOperationCancelled() {
                return
            }
            self.drawingView.towerOfHanoi = tower
            NSThread.sleepForTimeInterval(0.5)
            
            self.moveAnimatedTower(tower: &tower, numberOfDisks: numberOfDisks - 1, sourcePole: &temporaryPole, destinationPole: &destinationPole, temporaryPole: &sourcePole)
        }
    }
    
    private func moveTower(inout tower tower: TowerOfHanoi, numberOfDisks: Int, inout sourcePole: [Disk], inout destinationPole: [Disk], inout temporaryPole: [Disk]) {
        if (numberOfDisks > 0) {
            self.moveTower(tower: &tower, numberOfDisks: numberOfDisks - 1, sourcePole: &sourcePole, destinationPole: &temporaryPole, temporaryPole: &destinationPole)
            self.moveSingleDisk(sourcePole: &sourcePole, destinationPole: &destinationPole)
            self.moveTower(tower: &tower, numberOfDisks: numberOfDisks - 1, sourcePole: &temporaryPole, destinationPole: &destinationPole, temporaryPole: &sourcePole)
        }
    }
    
    private func isCurrentOperationCancelled() -> Bool {
        if let currentQueue = NSOperationQueue.currentQueue() {
            if currentQueue.operationCount > 0 {
                let operation: NSOperation = currentQueue.operations[0] as NSOperation
                return operation.cancelled
            }
        }
        
        return false
    }
}

