//
//  SetsOfNumbersThatAddUpTo.swift
//  SetsOfNumbersThatAddUpTo
//
//  Created by Rogelio Gudino on 11/25/18.
//  Copyright © 2018 Rogelio Gudino. All rights reserved.
//

public func setsOfNumbersThatAddUpTo(sum: Int, numbers: [Int]) -> [[Int]] {
  if sum == 0 || numbers.count == 0 {
    return [[]]
  }

  let lastNumber = numbers.last!
  let subsetNumbers = Array(numbers.prefix(numbers.count - 1))
  if sum < lastNumber {
    return setsOfNumbersThatAddUpTo(sum: sum, numbers: subsetNumbers)
  } else if sum == lastNumber {
    return [[lastNumber]] + setsOfNumbersThatAddUpTo(sum: sum, numbers: subsetNumbers)
  } else {
    let remainder = sum - lastNumber
    return setsOfNumbersThatAddUpTo(sum: remainder, numbers: subsetNumbers).filter { $0.count > 0 }.map { (x) -> [Int] in
      var mx = x
      mx.append(lastNumber)
      return mx
    }
  }
}

public func memoizedSetsOfNumbersThatAddUpTo(sum: Int, numbers: [Int], memoization: inout [String : [[Int]]]) -> [[Int]] {
  let key = "\(sum):\(numbers.count)"
  if let existingResult = memoization[key] {
    return existingResult
  }

  if sum == 0 || numbers.count == 0 {
    return [[]]
  }

  let lastNumber = numbers.last!
  let subsetNumbers = Array(numbers.prefix(numbers.count - 1))
  let result: [[Int]]
  if sum < lastNumber {
    result = setsOfNumbersThatAddUpTo(sum: sum, numbers: subsetNumbers)
  } else if sum == lastNumber {
    result = [[lastNumber]] + setsOfNumbersThatAddUpTo(sum: sum, numbers: subsetNumbers)
  } else {
    let remainder = sum - lastNumber
    result = setsOfNumbersThatAddUpTo(sum: remainder, numbers: subsetNumbers).filter { $0.count > 0 }.map { (x) -> [Int] in
      var mx = x
      mx.append(lastNumber)
      return mx
    }
  }
  memoization[key] = result
  return result
}
