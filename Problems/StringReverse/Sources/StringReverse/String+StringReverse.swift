import Stack

public extension String {
  func reversedViaStackIteration() -> String {
    if self.count == 0 {
      return self
    }

    var stack = Stack<Character>()
    for character in self {
      stack.push(character)
    }
    var result = [Character]()
    while stack.peek() != nil {
      result.append(stack.pop())
    }
    return String(result)
  }

  func reversedViaArrayIteration() -> String {
    if self.count == 0 {
      return self
    }

    var result = [Character]()
    var characters = self
    while characters.last != nil {
      result.append(characters.removeLast())
    }
    return String(result)
  }

  func reversedViaArrayTwoSideBuildup() -> String {
    if self.count == 0 {
      return self
    }

    var result = Array(self)
    var leftIndex = 0
    var rightIndex = result.count - 1

    while leftIndex < rightIndex {
      let leftCharacter = result[leftIndex]
      let rightCharacter = result[rightIndex]
      result[leftIndex] = rightCharacter
      result[rightIndex] = leftCharacter
      leftIndex += 1
      rightIndex -= 1
    }
    return String(result)
  }
}
