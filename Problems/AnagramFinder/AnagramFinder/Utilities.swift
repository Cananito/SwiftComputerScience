//
//  Utilities.swift
//  AnagramFinder
//
//  Created by Rogelio Gudino on 8/23/15.
//  Copyright © 2015 Rogelio Gudino. All rights reserved.
//

import Foundation

public func outputStringFromLaunchPath(launchPath: String, arguments: Array<String>) -> String {
    let task = NSTask()
    
    task.launchPath = launchPath
    task.arguments = arguments
    
    let pipe = NSPipe()
    task.standardOutput = pipe
    let fileHandle = pipe.fileHandleForReading
    
    task.launch()
    let outputData = fileHandle.readDataToEndOfFile()
    return NSString(data: outputData, encoding: NSUTF8StringEncoding) as! String
}
