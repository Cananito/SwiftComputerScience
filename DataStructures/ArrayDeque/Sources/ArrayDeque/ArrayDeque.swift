public struct ArrayDeque<T> {
  private var storage: ArrayDequeStorage<T>

  public init() {
    self.storage = ArrayDequeStorage()
  }

  public init(array: [T]) {
    self.storage = ArrayDequeStorage(array: array)
  }

  public subscript(index: Int) -> T? {
    return storage[index]
  }

  public func count() -> Int {
    return storage.count
  }

  public func isEmpty() -> Bool {
    return storage.isEmpty()
  }

  public func last() -> T? {
    let count = self.count()
    if count == 0 {
      return nil
    }
    let index = count - 1
    return storage[index]
  }

  public mutating func prepend(_ element: T) {
    makeCopyOfStorageReferenceIfNecessary()
    storage.prepend(element)
  }

  public mutating func append(_ element: T) {
    makeCopyOfStorageReferenceIfNecessary()
    storage.append(element)
  }

  public mutating func removeFirst() -> T? {
    makeCopyOfStorageReferenceIfNecessary()
    return storage.removeFirst()
  }

  public mutating func removeLast() -> T? {
    makeCopyOfStorageReferenceIfNecessary()
    return storage.removeLast()
  }

  private mutating func makeCopyOfStorageReferenceIfNecessary() {
    if isKnownUniquelyReferenced(&storage) == false {
      storage = ArrayDequeStorage<T>(arrayDequeStorage: storage)
    }
  }
}

fileprivate class ArrayDequeStorage<T> {
  private var storage: UnsafeMutablePointer<T>
  private var startIndex = 0
  private var endIndex = 0
  private var capacity = 4
  fileprivate var count = 0

  fileprivate init() {
    storage = UnsafeMutablePointer<T>.allocate(capacity: capacity)
  }

  fileprivate init(array: [T]) {
    storage = UnsafeMutablePointer<T>.allocate(capacity: array.count)
    // TODO: This might be incorrect... See if the array as input is ok.
    storage.initialize(from: array, count: array.count)
    count = array.count
    capacity = count
    if count != 0 {
      endIndex = count - 1
    }
  }

  fileprivate init(arrayDequeStorage: ArrayDequeStorage<T>) {
    storage = UnsafeMutablePointer<T>.allocate(capacity: arrayDequeStorage.count)
    storage.initialize(from: arrayDequeStorage.storage, count: arrayDequeStorage.count)
    startIndex = arrayDequeStorage.startIndex
    endIndex = arrayDequeStorage.endIndex
    capacity = arrayDequeStorage.capacity
    count = arrayDequeStorage.count
  }

  deinit {
    storage.deinitialize(count: capacity)
    storage.deallocate()
  }

  fileprivate subscript(index: Int) -> T? {
    if index > (count - 1) {
      return nil
    }
    return elementAtIndex(index)
  }

  fileprivate func isEmpty() -> Bool {
    return count == 0
  }

  fileprivate func prepend(_ element: T) {
    expandStorageIfNecessary()
    decrementStartIndex()
    (storage + startIndex).initialize(to: element)
    count += 1
  }

  fileprivate func append(_ element: T) {
    expandStorageIfNecessary()
    if isEmpty() == false {
      incrementEndIndex()
    }
    (storage + endIndex).initialize(to: element)
    count += 1
  }

  fileprivate func removeFirst() -> T? {
    if isEmpty() {
      return nil
    }

    let element = (storage + startIndex).move()
    count -= 1
    incrementStartIndex()

    shrinkStorageIfNecessary()

    return element
  }

  fileprivate func removeLast() -> T? {
    if isEmpty() {
      return nil
    }

    let element = (storage + endIndex).move()
    count -= 1
    decrementEndIndex()

    shrinkStorageIfNecessary()

    return element
  }

  private func elementAtIndex(_ index: Int) -> T {
    return (storage + self.adjustedIndex(from: index)).pointee
  }

  private func adjustedIndex(from index: Int) -> Int {
    let tempIndex = index + startIndex
    return (tempIndex >= capacity) ? tempIndex - capacity : tempIndex
  }

  private func incrementStartIndex() {
    let shouldMatchOtherIndex = isEmpty() && endIndex == startIndex

    let tempIndex = startIndex + 1
    startIndex = (tempIndex == capacity) ? 0 : tempIndex

    if shouldMatchOtherIndex {
      endIndex = startIndex
    }
  }

  private func decrementStartIndex() {
    let shouldMatchOtherIndex = isEmpty() && endIndex == startIndex

    if startIndex == 0 {
      startIndex = capacity - 1
    } else {
      startIndex -= 1
    }

    if shouldMatchOtherIndex {
      endIndex = startIndex
    }
  }

  private func incrementEndIndex() {
    let shouldMatchOtherIndex = isEmpty() && startIndex == endIndex

    let tempIndex = endIndex + 1
    endIndex = (tempIndex == capacity) ? 0 : tempIndex

    if shouldMatchOtherIndex {
      startIndex = endIndex
    }
  }

  private func decrementEndIndex() {
    let shouldMatchOtherIndex = isEmpty() && startIndex == endIndex

    if endIndex == 0 {
      endIndex = capacity - 1
    } else {
      endIndex -= 1
    }

    if shouldMatchOtherIndex {
      startIndex = endIndex
    }
  }

  private func expandStorageIfNecessary() {
    if capacity <= count {
      adjustStorageToNewCapacity(capacity * 2)
    }
  }

  private func shrinkStorageIfNecessary() {
    if (capacity / 4) >= count {
      adjustStorageToNewCapacity(capacity / 2)
    }
  }

  private func adjustStorageToNewCapacity(_ newCapacity: Int) {
    let newStorage = UnsafeMutablePointer<T>.allocate(capacity: newCapacity)
    newStorage.moveInitialize(from: (storage + self.adjustedIndex(from: 0)), count: newCapacity)

    storage.deallocate()
    storage = newStorage
    capacity = newCapacity

    startIndex = 0
    if count == 0 {
      endIndex = 0
    } else {
      endIndex = count - 1
    }
  }
}
