import XCTest
import DataStructures_Heap_Heap

class HeapTests: XCTestCase {
    func testHeap() {
        var heap = Heap<Int>(leftIsHigherPriority: >)
        XCTAssertEqual(heap.count(), 0)
        XCTAssertTrue(heap.isEmpty())

        heap.insert(element: 5)
        XCTAssertEqual(heap.count(), 1)
        XCTAssertEqual(heap.peek(), 5)
        XCTAssertFalse(heap.isEmpty())

        heap.insert(element: 24)
        XCTAssertEqual(heap.count(), 2)
        XCTAssertEqual(heap.peek(), 24)
        XCTAssertFalse(heap.isEmpty())

        heap.insert(element: 1)
        XCTAssertEqual(heap.count(), 3)
        XCTAssertEqual(heap.peek(), 24)
        XCTAssertFalse(heap.isEmpty())

        heap.insert(element: 26)
        XCTAssertEqual(heap.count(), 4)
        XCTAssertEqual(heap.peek(), 26)
        XCTAssertFalse(heap.isEmpty())

        heap.insert(element: 7)
        XCTAssertEqual(heap.count(), 5)
        XCTAssertEqual(heap.peek(), 26)
        XCTAssertFalse(heap.isEmpty())

        heap.insert(element: 50)
        XCTAssertEqual(heap.count(), 6)
        XCTAssertEqual(heap.peek(), 50)
        XCTAssertFalse(heap.isEmpty())

        heap.insert(element: 48)
        XCTAssertEqual(heap.count(), 7)
        XCTAssertEqual(heap.peek(), 50)
        XCTAssertFalse(heap.isEmpty())

        heap.insert(element: 2)
        XCTAssertEqual(heap.count(), 8)
        XCTAssertEqual(heap.peek(), 50)
        XCTAssertFalse(heap.isEmpty())

        XCTAssertEqual(heap.remove(), 50)
        XCTAssertEqual(heap.count(), 7)
        XCTAssertFalse(heap.isEmpty())

        XCTAssertEqual(heap.remove(), 48)
        XCTAssertEqual(heap.count(), 6)
        XCTAssertFalse(heap.isEmpty())

        XCTAssertEqual(heap.remove(), 26)
        XCTAssertEqual(heap.count(), 5)
        XCTAssertFalse(heap.isEmpty())

        XCTAssertEqual(heap.remove(), 24)
        XCTAssertEqual(heap.count(), 4)
        XCTAssertFalse(heap.isEmpty())

        XCTAssertEqual(heap.remove(), 7)
        XCTAssertEqual(heap.count(), 3)
        XCTAssertFalse(heap.isEmpty())

        XCTAssertEqual(heap.remove(), 5)
        XCTAssertEqual(heap.count(), 2)
        XCTAssertFalse(heap.isEmpty())

        XCTAssertEqual(heap.remove(), 2)
        XCTAssertEqual(heap.count(), 1)
        XCTAssertFalse(heap.isEmpty())

        XCTAssertEqual(heap.remove(), 1)
        XCTAssertEqual(heap.count(), 0)
        XCTAssertTrue(heap.isEmpty())
    }
}
