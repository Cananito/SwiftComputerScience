public class LinkedListNode<T: Hashable>: CustomStringConvertible, CustomDebugStringConvertible {
  public let value: T
  public var nextNode: LinkedListNode?
  public var previousNode: LinkedListNode?

  init(value: T) {
    self.value = value
  }

  // MARK: CustomStringConvertible

  public var description: String {
    if let nextNode = self.nextNode {
      return "\(self.value) -> \(nextNode.description)"
    }
    return "\(self.value)"
  }

  // MARK: CustomDebugStringConvertible

  public var debugDescription: String {
    if let nextNode = self.nextNode {
      return "\(self.value) -> \(nextNode.debugDescription)"
    }
    return "\(self.value)"
  }
}
