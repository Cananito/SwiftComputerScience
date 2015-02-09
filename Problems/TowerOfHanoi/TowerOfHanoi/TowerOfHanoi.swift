//
//  TowerOfHanoi.swift
//  SwiftTowerOfHanoi
//
//  Created by Rogelio Gudino on 8/3/14.
//  Copyright (c) 2014 Cananito. All rights reserved.
//

public struct TowerOfHanoi {
    public var sourcePole: [Disk] = []
    public var destinationPole: [Disk] = []
    public var temporaryPole: [Disk] = []
    
    public func totalDiskCount() -> Int {
        return self.sourcePole.count + self.destinationPole.count + self.temporaryPole.count
    }
}
