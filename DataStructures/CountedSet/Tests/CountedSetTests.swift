import XCTest
import DataStructures_CountedSet_CountedSet

class CountedSetTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testIncrementAndDecrementElements() {
        let firstElement = "First"
        let secondElement = "Second"
        let thirdElement = "Third"

        var countedSet = CountedSet<String>()
        XCTAssertEqual(countedSet.countForElement(element: firstElement), 0)
        XCTAssertEqual(countedSet.countForElement(element: secondElement), 0)
        XCTAssertEqual(countedSet.countForElement(element: thirdElement), 0)

        XCTAssertEqual(countedSet.incrementCountForElement(element: firstElement), 1)
        XCTAssertEqual(countedSet.countForElement(element: firstElement), 1)
        XCTAssertEqual(countedSet.countForElement(element: secondElement), 0)
        XCTAssertEqual(countedSet.countForElement(element: thirdElement), 0)

        XCTAssertEqual(countedSet.incrementCountForElement(element: firstElement), 2)
        XCTAssertEqual(countedSet.countForElement(element: firstElement), 2)
        XCTAssertEqual(countedSet.countForElement(element: secondElement), 0)
        XCTAssertEqual(countedSet.countForElement(element: thirdElement), 0)

        XCTAssertEqual(countedSet.incrementCountForElement(element: secondElement), 1)
        XCTAssertEqual(countedSet.countForElement(element: firstElement), 2)
        XCTAssertEqual(countedSet.countForElement(element: secondElement), 1)
        XCTAssertEqual(countedSet.countForElement(element: thirdElement), 0)

        XCTAssertEqual(countedSet.incrementCountForElement(element: secondElement), 2)
        XCTAssertEqual(countedSet.countForElement(element: firstElement), 2)
        XCTAssertEqual(countedSet.countForElement(element: secondElement), 2)
        XCTAssertEqual(countedSet.countForElement(element: thirdElement), 0)

        XCTAssertEqual(countedSet.incrementCountForElement(element: thirdElement), 1)
        XCTAssertEqual(countedSet.countForElement(element: firstElement), 2)
        XCTAssertEqual(countedSet.countForElement(element: secondElement), 2)
        XCTAssertEqual(countedSet.countForElement(element: thirdElement), 1)

        XCTAssertEqual(countedSet.incrementCountForElement(element: thirdElement), 2)
        XCTAssertEqual(countedSet.countForElement(element: firstElement), 2)
        XCTAssertEqual(countedSet.countForElement(element: secondElement), 2)
        XCTAssertEqual(countedSet.countForElement(element: thirdElement), 2)

        XCTAssertEqual(countedSet.decrementCountForElement(element: firstElement), 1)
        XCTAssertEqual(countedSet.countForElement(element: firstElement), 1)
        XCTAssertEqual(countedSet.countForElement(element: secondElement), 2)
        XCTAssertEqual(countedSet.countForElement(element: thirdElement), 2)

        XCTAssertEqual(countedSet.decrementCountForElement(element: secondElement), 1)
        XCTAssertEqual(countedSet.countForElement(element: firstElement), 1)
        XCTAssertEqual(countedSet.countForElement(element: secondElement), 1)
        XCTAssertEqual(countedSet.countForElement(element: thirdElement), 2)

        XCTAssertEqual(countedSet.decrementCountForElement(element: thirdElement), 1)
        XCTAssertEqual(countedSet.countForElement(element: firstElement), 1)
        XCTAssertEqual(countedSet.countForElement(element: secondElement), 1)
        XCTAssertEqual(countedSet.countForElement(element: thirdElement), 1)

        XCTAssertEqual(countedSet.decrementCountForElement(element: firstElement), 0)
        XCTAssertEqual(countedSet.countForElement(element: firstElement), 0)
        XCTAssertEqual(countedSet.countForElement(element: secondElement), 1)
        XCTAssertEqual(countedSet.countForElement(element: thirdElement), 1)

        XCTAssertEqual(countedSet.decrementCountForElement(element: secondElement), 0)
        XCTAssertEqual(countedSet.countForElement(element: firstElement), 0)
        XCTAssertEqual(countedSet.countForElement(element: secondElement), 0)
        XCTAssertEqual(countedSet.countForElement(element: thirdElement), 1)

        XCTAssertEqual(countedSet.decrementCountForElement(element: thirdElement), 0)
        XCTAssertEqual(countedSet.countForElement(element: firstElement), 0)
        XCTAssertEqual(countedSet.countForElement(element: secondElement), 0)
        XCTAssertEqual(countedSet.countForElement(element: thirdElement), 0)
    }

    func testElements() {
        let firstElement = "1First"
        let secondElement = "2Second"
        let thirdElement = "3Third"

        var countedSet = CountedSet<String>()
        XCTAssertTrue(countedSet.elements().isEmpty)

        _ = countedSet.incrementCountForElement(element: firstElement)
        XCTAssertEqual(Array(countedSet.elements()), [firstElement])

        _ = countedSet.incrementCountForElement(element: secondElement)
        XCTAssertEqual(countedSet.elements().sorted(), [firstElement, secondElement])

        _ = countedSet.incrementCountForElement(element: thirdElement)
        XCTAssertEqual(countedSet.elements().sorted(), [firstElement, secondElement, thirdElement])

        _ = countedSet.decrementCountForElement(element: firstElement)
        XCTAssertEqual(countedSet.elements().sorted(), [secondElement, thirdElement])

        _ = countedSet.decrementCountForElement(element: secondElement)
        XCTAssertEqual(Array(countedSet.elements()), [thirdElement])

        _ = countedSet.decrementCountForElement(element: thirdElement)
        XCTAssertTrue(countedSet.elements().isEmpty)
    }
}
