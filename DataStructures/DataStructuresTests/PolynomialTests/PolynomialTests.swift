//
//  PolynomialTests.swift
//  DataStructures
//
//  Created by Rogelio Gudino on 8/16/15.
//  Copyright © 2017 Rogelio Gudino. All rights reserved.
//

import XCTest
import DataStructures

class PolynomialTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testStringRepresentation() {
        let polynomial = Polynomial(terms: [
            Term(constant: 5, coefficient: 2),
            Term(constant: 3, coefficient: 1),
            Term(constant: 1, coefficient: 0)
            ])
        let derivedPolynomial = polynomial.derived()
        XCTAssert(polynomial.description == "5x^2, 3x, 1", "Polynomial's string representation.")
        XCTAssert(derivedPolynomial.description == "10x, 3", "Derived polynomial's string representation.")
        
        let negativeExponentPolynomial = Polynomial(terms: [
            Term(constant: 10, coefficient: -3)
            ])
        let derivedNegativeExponentPolynomial = negativeExponentPolynomial.derived()
        XCTAssert(negativeExponentPolynomial.description == "10x^-3", "Polynomial's string representation.")
        XCTAssert(derivedNegativeExponentPolynomial.description == "-30x^-4", "Derived polynomial's string representation.")
    }
}
