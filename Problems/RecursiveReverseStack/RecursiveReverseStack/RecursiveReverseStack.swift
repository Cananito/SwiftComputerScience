//
//  RecursiveReverseStack.swift
//  RecursiveReverseStack
//
//  Created by Rogelio Gudino on 8/12/17.
//  Copyright © 2017 Rogelio Gudino. All rights reserved.
//

import DataStructures

public extension Stack {
    public static func reverseStack(_ stack: inout Stack<T>) {
        if stack.count() < 2 {
            return
        }
        
        let value = stack.pop()!
        if stack.count() != 1 {
            reverseStack(&stack)
        }
        pushToBottom(value, stack: &stack)
    }
    
    private static func pushToBottom(_ bottomValue: T, stack: inout Stack<T>) {
        let value = stack.pop()!
        if stack.count() != 0 {
            pushToBottom(bottomValue, stack: &stack)
        } else {
            stack.push(bottomValue)
        }
        stack.push(value)
    }
}

