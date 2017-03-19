//
//  PriorityQueue.swift
//  DataStructures
//
//  Created by Rogelio Gudino on 3/18/17.
//  Copyright © 2017 Rogelio Gudino. All rights reserved.
//

public protocol PriorityQueue {
    associatedtype Element: Comparable
    init(leftIsHigherPriority: @escaping (Element, Element) -> Bool)
    func isEmpty() -> Bool
    func count() -> Int
    func peek() -> Element?
    mutating func insert(element: Element)
    mutating func remove() -> Element?
}
