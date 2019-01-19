//
//  AckermannFunctionApp.swift
//  AckermannFunctionApp
//
//  Created by Rogelio Gudino on 01/19/19.
//  Copyright (c) 2019 Rogelio Gudino. All rights reserved.
//

import Darwin
import Problems_AckermannFunction_AckermannFunction

let arguments = CommandLine.arguments
let argumentsCount = arguments.count
if argumentsCount != 3 {
  print("Need 2 arguments, not \(argumentsCount - 1)!!")
  exit(EXIT_FAILURE)
}

// Argument 0 is executable location.
let firstArgument = arguments[1]
let secondArgument = arguments[2]

guard let firstValue = Int(firstArgument) else {
  print("First argument needs to be a valid integer.")
  exit(EXIT_FAILURE)
}
guard let secondValue = Int(secondArgument) else {
  print("Second argument needs to be a valid integer.")
  exit(EXIT_FAILURE)
}

print(">>> Starting to calculate...")
let result = ackermann(firstValue, secondValue)
print(">>> Ackerman Function result for (\(firstValue), \(secondValue)) is \(result)")
