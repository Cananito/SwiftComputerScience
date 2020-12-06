private func badCharacterRuleTableForPattern(pattern: String) -> [Character: Int] {
  var table = [Character: Int]()
  let lastCharacterIndex = pattern.count - 1
  for (index, character) in pattern.enumerated() {
    table[character] = lastCharacterIndex - index
  }
  return table
}

public struct BoyerMooreHorspoolPattern {
  public let string: String
  internal let characterCount: Int
  private let badCharacterRuleTable: [Character: Int]

  public init(string: String) {
    self.string = string
    self.characterCount = string.count
    self.badCharacterRuleTable = badCharacterRuleTableForPattern(pattern: string)
  }

  internal func badCharacterRuleShift(character: Character) -> Int {
    if let index = self.badCharacterRuleTable[character] {
      return index
    }
    return self.characterCount
  }
}

public func boyerMooreHorspoolStringSearch(pattern: BoyerMooreHorspoolPattern, document: String) -> [Range<Int>] {
  if pattern.string.count < 1 || document.count < 1 {
    return []
  }

  if pattern.string.count > document.count {
    return []
  }

  var ranges = [Range<Int>]()
  var currentDocumentIndex = document.startIndex
  let patternCharacterCount = pattern.characterCount
  let endIndex = document.index(document.endIndex, offsetBy: -patternCharacterCount)

  while true {
    var shift = 1
    var match = true

    // TODO: All this `index(_:,offsetBy:)` and `distance(from:to:)` is super inefficient, tune.
    for index in stride(from: patternCharacterCount - 1, to: 0, by: -1) {
      let documentIndex = document.index(currentDocumentIndex, offsetBy: index)
      let patternIndex = pattern.string.index(pattern.string.startIndex, offsetBy: index)

      let documentCharacter = document[documentIndex]
      let patternCharacter = pattern.string[patternIndex]

      if documentCharacter != patternCharacter {
        let badCharacterShift = pattern.badCharacterRuleShift(character: documentCharacter)
        shift = max(badCharacterShift, shift)
        match = false
        break
      }
    }

    if match == true {
      let start = document.distance(from: document.startIndex, to: currentDocumentIndex)
      let end = document.distance(from: document.startIndex, to: document.index(currentDocumentIndex, offsetBy: patternCharacterCount))
      let range = start..<end
      ranges.append(range)
    }

    if currentDocumentIndex == endIndex {
      break
    }

    if let possibleCurrentDocumentIndex = document.index(currentDocumentIndex, offsetBy: shift, limitedBy: endIndex) {
      currentDocumentIndex = possibleCurrentDocumentIndex
    } else {
      break
    }
  }

  return ranges
}
