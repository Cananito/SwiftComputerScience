import XCTest
import Problems_SetsOfNumbersThatAddUpTo_SetsOfNumbersThatAddUpTo

class SetsOfNumbersThatAddUpToTests : XCTestCase {
    func testSetsOfNumbersThatAddUpTo() {
        var result: [[Int]]? = nil
        // Time: 0.145 sec (10% STDEV)
        self.measure {
            for _ in 0...10000 {
                result = setsOfNumbersThatAddUpTo(sum: 16, numbers: [2, 4, 6, 10])
            }
        }
        XCTAssertEqual(result, [[6, 10], [2, 4, 10]])
    }
    func testMemoizedSetsOfNumbersThatAddUpTo() {
        var result: [[Int]]? = nil
        // Time: 0.019 sec (10% STDEV)
        self.measure {
            var memoization = [String : [[Int]]]()
            for _ in 0...10000 {
                result = memoizedSetsOfNumbersThatAddUpTo(sum: 16, numbers: [2, 4, 6, 10], memoization: &memoization)
            }
        }
        XCTAssertEqual(result, [[6, 10], [2, 4, 10]])
    }
}
