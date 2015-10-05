//
//  TrieTests.swift
//  DataStructures
//
//  Created by Rogelio Gudino on 10/4/15.
//  Copyright © 2015 Rogelio Gudino. All rights reserved.
//

import XCTest
@testable import DataStructures

class TrieTests: XCTestCase {
    func testTrie() {
        var trie = Trie<Int>()
        trie.setValue(1, key: "R")
        trie.setValue(2, key: "Ro")
        trie.setValue(3, key: "Rog")
        trie.setValue(4, key: "Roge")
        trie.setValue(5, key: "Rogel")
        trie.setValue(6, key: "Rogeli")
        trie.setValue(7, key: "Rogelio")
        trie.setValue(11, key: "G")
        trie.setValue(12, key: "Gu")
        trie.setValue(13, key: "Gud")
        trie.setValue(14, key: "Gudi")
        trie.setValue(15, key: "Gudin")
        trie.setValue(16, key: "Gudino")
        
        XCTAssert(trie.valueForKey("R")! == 1)
        XCTAssert(trie.valueForKey("Ro")! == 2)
        XCTAssert(trie.valueForKey("Rog")! == 3)
        XCTAssert(trie.valueForKey("Roge")! == 4)
        XCTAssert(trie.valueForKey("Rogel")! == 5)
        XCTAssert(trie.valueForKey("Rogeli")! == 6)
        XCTAssert(trie.valueForKey("Rogelio")! == 7)
        XCTAssert(trie.valueForKey("G")! == 11)
        XCTAssert(trie.valueForKey("Gu")! == 12)
        XCTAssert(trie.valueForKey("Gud")! == 13)
        XCTAssert(trie.valueForKey("Gudi")! == 14)
        XCTAssert(trie.valueForKey("Gudin")! == 15)
        XCTAssert(trie.valueForKey("Gudino")! == 16)
        
        XCTAssert(trie.removeValueForKey("R")! == 1)
        XCTAssert(trie.valueForKey("R") == nil)
        XCTAssert(trie.valueForKey("Ro")! == 2)
        
        XCTAssert(trie.removeValueForKey("Ro")! == 2)
        XCTAssert(trie.valueForKey("Ro") == nil)
        XCTAssert(trie.valueForKey("Rog")! == 3)
        
        XCTAssert(trie.removeValueForKey("Rog")! == 3)
        XCTAssert(trie.valueForKey("Rog") == nil)
        XCTAssert(trie.valueForKey("Roge")! == 4)
        
        XCTAssert(trie.removeValueForKey("Roge")! == 4)
        XCTAssert(trie.valueForKey("Roge") == nil)
        XCTAssert(trie.valueForKey("Rogel")! == 5)
        
        XCTAssert(trie.removeValueForKey("Rogel")! == 5)
        XCTAssert(trie.valueForKey("Rogel") == nil)
        XCTAssert(trie.valueForKey("Rogeli")! == 6)
        
        XCTAssert(trie.removeValueForKey("Rogeli")! == 6)
        XCTAssert(trie.valueForKey("Rogeli") == nil)
        XCTAssert(trie.valueForKey("Rogelio")! == 7)
        
        XCTAssert(trie.removeValueForKey("Rogelio")! == 7)
        XCTAssert(trie.valueForKey("Rogelio") == nil)
        
        XCTAssert(trie.removeValueForKey("Gudino")! == 16)
        XCTAssert(trie.valueForKey("Gudino") == nil)
        
        XCTAssert(trie.removeValueForKey("Gudin")! == 15)
        XCTAssert(trie.valueForKey("Gudin") == nil)
        
        XCTAssert(trie.removeValueForKey("Gudi")! == 14)
        XCTAssert(trie.valueForKey("Gudi") == nil)
        
        XCTAssert(trie.removeValueForKey("Gud")! == 13)
        XCTAssert(trie.valueForKey("Gud") == nil)
        
        XCTAssert(trie.removeValueForKey("Gu")! == 12)
        XCTAssert(trie.valueForKey("Gu") == nil)
        
        XCTAssert(trie.removeValueForKey("G")! == 11)
        XCTAssert(trie.valueForKey("G") == nil)
    }
}
