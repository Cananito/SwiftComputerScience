//
//  Fibonacci.swift
//  Fibonacci
//
//  Created by Rogelio Gudino on 3/18/17.
//  Copyright © 2017 Rogelio Gudino. All rights reserved.
//

public func iterativeFibonacci(position: Int) -> Int {
    if position == 0 {
        return 0
    }
    if position < 2 {
        return 1
    }
    var result = 1
    var first = 0
    var second = 1
    for _ in 2 ... position {
        result = first + second
        first = second
        second = result
    }
    return result
}

public func recursiveFibonacci(position: Int) -> Int {
    if position < 2 {
        return position
    } else {
        return recursiveFibonacci(position: position - 1) + recursiveFibonacci(position: position - 2)
    }
}

public func memoizedRecursiveFibonacci(position: Int, memoization: inout [Int : Int]) -> Int {
    if let result = memoization[position] {
        return result
    }
    if position < 2 {
        memoization[position] = position
        return position
    } else {
        let result = memoizedRecursiveFibonacci(position: position - 1, memoization: &memoization) + memoizedRecursiveFibonacci(position: position - 2, memoization: &memoization)
        memoization[position] = result
        return result
    }
}
