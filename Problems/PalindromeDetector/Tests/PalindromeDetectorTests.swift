import XCTest
import Problems_PalindromeDetector_PalindromeDetector

class PalindromeDetectorTests: XCTestCase {
    let first = ""
    let second = "a"
    let third = "aa"
    let fourth = "aba"
    let fifth = "abaa"
    let sixth = "aaba"
    let seventh = "anita lava la tina"

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testIsPalindromUsingIteration() {
        XCTAssertTrue(first.withoutWhiteSpaces().isPalindromeUsingIteration())
        XCTAssertTrue(second.withoutWhiteSpaces().isPalindromeUsingIteration())
        XCTAssertTrue(third.withoutWhiteSpaces().isPalindromeUsingIteration())
        XCTAssertTrue(fourth.withoutWhiteSpaces().isPalindromeUsingIteration())
        XCTAssertFalse(fifth.withoutWhiteSpaces().isPalindromeUsingIteration())
        XCTAssertFalse(sixth.withoutWhiteSpaces().isPalindromeUsingIteration())
        XCTAssertTrue(seventh.withoutWhiteSpaces().isPalindromeUsingIteration())
    }

    func testIsPalindromeUsingRecursion() {
        XCTAssertTrue(first.withoutWhiteSpaces().isPalindromeUsingRecursion())
        XCTAssertTrue(second.withoutWhiteSpaces().isPalindromeUsingRecursion())
        XCTAssertTrue(third.withoutWhiteSpaces().isPalindromeUsingRecursion())
        XCTAssertTrue(fourth.withoutWhiteSpaces().isPalindromeUsingRecursion())
        XCTAssertFalse(fifth.withoutWhiteSpaces().isPalindromeUsingRecursion())
        XCTAssertFalse(sixth.withoutWhiteSpaces().isPalindromeUsingRecursion())
        XCTAssertTrue(seventh.withoutWhiteSpaces().isPalindromeUsingRecursion())
    }

    func testIsPalindromeUsingStack() {
        XCTAssertTrue(first.withoutWhiteSpaces().isPalindromeUsingStack())
        XCTAssertTrue(second.withoutWhiteSpaces().isPalindromeUsingStack())
        XCTAssertTrue(third.withoutWhiteSpaces().isPalindromeUsingStack())
        XCTAssertTrue(fourth.withoutWhiteSpaces().isPalindromeUsingStack())
        XCTAssertFalse(fifth.withoutWhiteSpaces().isPalindromeUsingStack())
        XCTAssertFalse(sixth.withoutWhiteSpaces().isPalindromeUsingStack())
        XCTAssertTrue(seventh.withoutWhiteSpaces().isPalindromeUsingStack())
    }

    func testIsPalindromeUsingLinkedList() {
        XCTAssertTrue(first.withoutWhiteSpaces().isPalindromeUsingLinkedList())
        XCTAssertTrue(second.withoutWhiteSpaces().isPalindromeUsingLinkedList())
        XCTAssertTrue(third.withoutWhiteSpaces().isPalindromeUsingLinkedList())
        XCTAssertTrue(fourth.withoutWhiteSpaces().isPalindromeUsingLinkedList())
        XCTAssertFalse(fifth.withoutWhiteSpaces().isPalindromeUsingLinkedList())
        XCTAssertFalse(sixth.withoutWhiteSpaces().isPalindromeUsingLinkedList())
        XCTAssertTrue(seventh.withoutWhiteSpaces().isPalindromeUsingLinkedList())
    }

    func testIsPalindromeUsingArrayDeque() {
        XCTAssertFalse(first.withoutWhiteSpaces().isPalindromeUsingArrayDeque())
        XCTAssertFalse(second.withoutWhiteSpaces().isPalindromeUsingArrayDeque())
        XCTAssertFalse(third.withoutWhiteSpaces().isPalindromeUsingArrayDeque())
        XCTAssertFalse(fourth.withoutWhiteSpaces().isPalindromeUsingArrayDeque())
        XCTAssertFalse(fifth.withoutWhiteSpaces().isPalindromeUsingArrayDeque())
        XCTAssertFalse(sixth.withoutWhiteSpaces().isPalindromeUsingArrayDeque())
        XCTAssertFalse(seventh.withoutWhiteSpaces().isPalindromeUsingArrayDeque())
    }
}
