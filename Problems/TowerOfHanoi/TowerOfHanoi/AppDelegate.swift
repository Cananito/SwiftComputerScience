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
    private let backgroundOperationQueue: OperationQueue
    
    override init() {
        var disks = [Disk]()
        for i in 1 ..< 6 {
            let disk = Disk(identifier: i)
            disks.append(disk)
        }
        self.originalDisksArray = disks.reversed()
        self.backgroundOperationQueue = OperationQueue()
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.resetTower()
    }
    
    @IBAction func buttonWasClicked(_ sender: AnyObject!) {
        guard let cell: NSCell = sender.selectedCell() else { return }
        if cell.title == "Solve" {
            cell.title = "Finish"
            self.resetTower()
            self.solveTower(animated: true)
        } else if cell.title == "Finish" {
            self.backgroundOperationQueue.cancelAllOperations()
            self.resetTower()
            self.solveTower(animated: false)
        }
    }
    
    private func resetTower() {
        var towerOfHanoi = TowerOfHanoi()
        towerOfHanoi.sourcePole = self.originalDisksArray
        self.drawingView.towerOfHanoi = towerOfHanoi
    }
    
    private func solveTower(animated: Bool) {
        var newTowerOfHanoi = self.drawingView.towerOfHanoi
        
        if animated {
            self.backgroundOperationQueue.addOperation({
                Thread.sleep(forTimeInterval: 0.4)
                self.moveAnimatedTower(tower: &newTowerOfHanoi, numberOfDisks: newTowerOfHanoi.sourcePole.count, sourcePole: &newTowerOfHanoi.sourcePole, destinationPole: &newTowerOfHanoi.destinationPole, temporaryPole: &newTowerOfHanoi.temporaryPole)
                self.actionButton.title = "Solve"
            })
        } else {
            self.moveTower(tower: &newTowerOfHanoi, numberOfDisks: newTowerOfHanoi.sourcePole.count, sourcePole: &newTowerOfHanoi.sourcePole, destinationPole: &newTowerOfHanoi.destinationPole, temporaryPole: &newTowerOfHanoi.temporaryPole)
            self.drawingView.towerOfHanoi = newTowerOfHanoi
            self.actionButton.title = "Solve"
        }
    }
    
    private func moveSingleDisk(sourcePole: inout [Disk], destinationPole: inout [Disk]) {
        let disk = sourcePole.remove(at: 0)
        destinationPole.insert(disk, at: 0)
    }
    
    private func moveAnimatedTower(tower: inout TowerOfHanoi, numberOfDisks: Int, sourcePole: inout [Disk], destinationPole: inout [Disk], temporaryPole: inout [Disk]) {
        if (numberOfDisks > 0) {
            self.moveAnimatedTower(tower: &tower, numberOfDisks: numberOfDisks - 1, sourcePole: &sourcePole, destinationPole: &temporaryPole, temporaryPole: &destinationPole)
            self.moveSingleDisk(sourcePole: &sourcePole, destinationPole: &destinationPole)
            
            if self.isCurrentOperationCancelled() {
                return
            }
            self.drawingView.towerOfHanoi = tower
            Thread.sleep(forTimeInterval: 0.5)
            
            self.moveAnimatedTower(tower: &tower, numberOfDisks: numberOfDisks - 1, sourcePole: &temporaryPole, destinationPole: &destinationPole, temporaryPole: &sourcePole)
        }
    }
    
    private func moveTower(tower: inout TowerOfHanoi, numberOfDisks: Int, sourcePole: inout [Disk], destinationPole: inout [Disk], temporaryPole: inout [Disk]) {
        if (numberOfDisks > 0) {
            self.moveTower(tower: &tower, numberOfDisks: numberOfDisks - 1, sourcePole: &sourcePole, destinationPole: &temporaryPole, temporaryPole: &destinationPole)
            self.moveSingleDisk(sourcePole: &sourcePole, destinationPole: &destinationPole)
            self.moveTower(tower: &tower, numberOfDisks: numberOfDisks - 1, sourcePole: &temporaryPole, destinationPole: &destinationPole, temporaryPole: &sourcePole)
        }
    }
    
    private func isCurrentOperationCancelled() -> Bool {
        if let currentQueue = OperationQueue.current {
            if currentQueue.operationCount > 0 {
                let operation: Operation = currentQueue.operations[0] as Operation
                return operation.isCancelled
            }
        }
        
        return false
    }
}

