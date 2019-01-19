//
//  AckermannFunction.swift
//  AckermannFunction
//
//  Created by Rogelio Gudino on 01/19/19.
//  Copyright (c) 2019 Rogelio Gudino. All rights reserved.
//

public func ackermann(_ m: Int, _ n: Int) -> Int {
  if (m == 0) {
    return n + 1
  }
  if (n == 0) {
    return ackermann(m - 1, 1)
  }
  return ackermann(m - 1, ackermann(m, n - 1))
}
