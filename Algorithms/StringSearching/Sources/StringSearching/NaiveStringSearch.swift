public func naiveStringSearch(pattern: String, string: String) -> [Range<Int>] {
    if pattern.count < 1 || string.count < 1 {
        return []
    }
    var results = [Range<Int>]()
    var currentStart = 0
    while let range = rangeOfFirstOccurrance(start: currentStart, pattern: pattern, string: string) {
        results.append(range)
        currentStart = range.upperBound
        // TODO: Uncomment when upgrading to Xcode 10.
        // currentStart = range.endIndex
    }
    return results
}

private func rangeOfFirstOccurrance(start: Int, pattern: String, string: String) -> Range<Int>? {
    if pattern.count < 1 || string.count < 1 {
        return nil
    }

    if pattern.count > (string.count - start) {
        return nil
    }

    var possibleMatchingStartIndex: String.Index?

    var currentStringIndex = string.index(string.startIndex, offsetBy: start)
    var currentPatternIndex = pattern.startIndex

    while pattern.distance(from: currentPatternIndex, to: pattern.endIndex) > 0 && string.distance(from: currentStringIndex, to: string.endIndex) > 0 {
        let currentStringCharacter = string[currentStringIndex]
        let currentPatternCharacter = pattern[currentPatternIndex]

        if currentStringCharacter == currentPatternCharacter {
            if possibleMatchingStartIndex == nil {
                possibleMatchingStartIndex = currentStringIndex
            }
            currentPatternIndex = string.index(currentPatternIndex, offsetBy: 1)
        } else if possibleMatchingStartIndex != nil {
            possibleMatchingStartIndex = nil
            currentPatternIndex = pattern.startIndex
        }

        currentStringIndex = string.index(currentStringIndex, offsetBy: 1)
    }

    if let matchingStartIndex = possibleMatchingStartIndex {
        let matchingStart = string.distance(from: string.startIndex, to: matchingStartIndex)
        let matchingEnd = matchingStart + pattern.count
        return matchingStart..<matchingEnd
    }
    return nil
}
