//
//  Utilities.swift
//  AnagramFinder
//
//  Created by Rogelio Gudino on 8/23/15.
//  Copyright © 2015 Rogelio Gudino. All rights reserved.
//

import Foundation

public func outputStringFromLaunchPath(_ launchPath: String, arguments: Array<String>) -> String {
    let task = Process()
    
    task.launchPath = launchPath
    task.arguments = arguments
    
    let pipe = Pipe()
    task.standardOutput = pipe
    let fileHandle = pipe.fileHandleForReading
    
    task.launch()
    let outputData = fileHandle.readDataToEndOfFile()
    return NSString(data: outputData, encoding: String.Encoding.utf8.rawValue)! as String
}
