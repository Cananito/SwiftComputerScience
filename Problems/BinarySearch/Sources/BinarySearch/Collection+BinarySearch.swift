public extension Collection where Element: Comparable {
  func binarySearch(_ value: Element) -> Self.Index? {
    if self.count == 0 {
      return nil
    }
    return self.binarySearch(value, startIndex: self.startIndex, endIndex: self.index(self.endIndex, offsetBy: -1))
  }

  private func binarySearch(_ value: Element, startIndex: Self.Index, endIndex: Self.Index) -> Self.Index? {
    let middleIndex = self.index(startIndex, offsetBy: self.distance(from: startIndex, to: endIndex) / 2)
    let element = self[middleIndex]

    if element == value {
      return middleIndex
    }

    if startIndex == endIndex {
      return nil
    }

    if element > value {
      return self.binarySearch(value, startIndex: startIndex, endIndex: middleIndex)
    } else {
      return self.binarySearch(value, startIndex: self.index(middleIndex, offsetBy: 1), endIndex: endIndex)
    }
  }
}
