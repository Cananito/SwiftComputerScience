public class TrieNode<T> {
  public typealias Key = Character

  public let key: Key?
  public var value: T?
  private var parent: TrieNode<T>?
  private var children = [TrieNode<T>]()

  internal init(key: Key?, value: T?) {
    self.key = key
    self.value = value
  }

  internal func childNodeWithKey(_ key: Key) -> TrieNode<T>? {
    for node in children {
      if let nodeKey = node.key, nodeKey == key {
        return node
      }
    }
    return nil
  }

  internal func addChildNodeWithKey(_ key: Key) -> TrieNode<T> {
    if let existingNode = childNodeWithKey(key) {
      return existingNode
    } else {
      let node = TrieNode<T>(key: key, value: nil)
      node.parent = self
      children.append(node)
      return node
    }
  }

  internal func trim() {
    if value != nil || children.count > 0 {
      return
    }
    if let index = parent?.children.firstIndex(where: { return $0 === self }) {
      parent?.children.remove(at: index)
    }
    parent?.trim()
    parent = nil
  }
}
