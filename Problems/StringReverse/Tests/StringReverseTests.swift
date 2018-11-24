//
//  StringReverseTests.swift
//  StringReverseTests
//
//  Created by Rogelio Gudino on 11/24/18.
//  Copyright (c) 2018 Rogelio Gudino. All rights reserved.
//

import XCTest
import Problems_StringReverse_StringReverse

class StringReverseTests: XCTestCase {
    func testReversedViaStackIteration() {
        XCTAssertEqual("".reversedViaStackIteration(), "")
        XCTAssertEqual("Rogelio".reversedViaStackIteration(), "oilegoR")
    }

    func testReversedViaArrayIteration() {
        XCTAssertEqual("".reversedViaArrayIteration(), "")
        XCTAssertEqual("Rogelio".reversedViaArrayIteration(), "oilegoR")
    }

    func testReversedViaArrayTwoSideBuildup() {
        XCTAssertEqual("".reversedViaArrayTwoSideBuildup(), "")
        XCTAssertEqual("Rogelio".reversedViaArrayTwoSideBuildup(), "oilegoR")
    }

}
