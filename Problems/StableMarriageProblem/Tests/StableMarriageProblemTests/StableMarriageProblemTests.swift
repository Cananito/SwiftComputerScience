import XCTest
import StableMarriageProblem

class StableMarriageProblemTests: XCTestCase {
  func testStableMarriageProblem() {
    let charlotte = "Charlotte"
    let elizabeth = "Elizabeth"
    let jane = "Jane"
    let lydia = "Lydia"
    let bingley = "Bingley"
    let collins = "Collins"
    let darcy = "Darcy"
    let wickham = "Wickham"

    let proposersPreferences = [
      charlotte: [bingley, darcy, collins, wickham],
      elizabeth: [wickham, darcy, bingley, collins],
      jane: [bingley, wickham, darcy, collins],
      lydia: [bingley, wickham, darcy, collins],
    ]
    let recipientsPreferences = [
      bingley: [jane, elizabeth, lydia, charlotte],
      collins: [jane, elizabeth, lydia, charlotte],
      darcy: [elizabeth, jane, charlotte, lydia],
      wickham: [lydia, jane, elizabeth, charlotte],
    ]
    let expected = [
      charlotte: collins,
      elizabeth: darcy,
      jane: bingley,
      lydia: wickham,
    ]

    let result = StableMarriageProblem<String>.solve(proposersPreferences, recipientsPreferences)
    XCTAssertEqual(result!, expected)
  }

  static var allTests = [
    ("testStableMarriageProblem", testStableMarriageProblem),
  ]
}
