import DataStructures_Stack_Stack

public extension String {
  public func reversedViaStackIteration() -> String {
    if self.characters.count == 0 {
      return self
    }

    var stack = Stack<Character>()
    for character in self.characters {
      stack.push(character)
    }
    var result = [Character]()
    while stack.peek() != nil {
      result.append(stack.pop())
    }
    return String(result)
  }

  public func reversedViaArrayIteration() -> String {
    if self.characters.count == 0 {
      return self
    }

    var result = [Character]()
    var characters = self.characters
    while characters.last != nil {
      result.append(characters.removeLast())
    }
    return String(result)
  }

  public func reversedViaArrayTwoSideBuildup() -> String {
    if self.characters.count == 0 {
      return self
    }

    var result = Array(self.characters)
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
