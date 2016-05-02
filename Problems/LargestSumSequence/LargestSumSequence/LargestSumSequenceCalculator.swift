//
//  LargestSumSequenceCalculator.swift
//  LargestSumSequence
//
//  Created by Rogelio Gudino on 8/22/15.
//  Copyright © 2015 Rogelio Gudino. All rights reserved.
//

func largestSumSequence(array: [Int]) -> [Int] {
    var result = [Int]()
    var largest = Int.min
    var current = 0
    var start = 0
    var end = array.count - 1
    
    for i in 0 ..< array.count {
        if current < 0 {
            current = 0
            start = i
        }
        current += array[i]
        if current > largest {
            largest = current
            end = i
            result = Array(array[start...end])
        }
    }
    return result
}

func largestSum(array: [Int]) -> Int {
    var largest = Int.min
    var current = 0
    
    for number in array {
        if current < 0 {
            current = 0
        }
        current += number
        if current > largest {
            largest = current
        }
    }
    
    return largest
}

func largestSumSequenceSlow(array: [Int]) -> [Int] {
    var result = [Int]()
    var start = 0
    var end = array.count
    var sum = Int.min
    
    while start < array.count {
        end = array.count
        while end > start {
            let range = start ..< end
            let subArray = Array(array[range])
            let tempSum = subArray.reduce(0) { $0 + $1 }
            if tempSum > sum {
                sum = tempSum
                result = subArray
            }
            end -= 1
        }
        start += 1
    }
    
    return result
}

func largestSumSlow(array: [Int]) -> Int {
    var result = Int.min
    var start = 0
    var end = array.count
    
    while start < array.count {
        end = array.count
        while end > start {
            let range = start ..< end
            let subArray = Array(array[range])
            let sum = subArray.reduce(0) { $0 + $1 }
            if sum > result {
                result = sum
            }
            end -= 1
        }
        start += 1
    }
    
    return result
}
