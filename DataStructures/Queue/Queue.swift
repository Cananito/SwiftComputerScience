public struct Queue<T> {
    private var array = [T]()

    public init() {
    }

    public init(elements: [T]) {
        self.array = elements
    }

    public func count() -> Int {
        return self.array.count
    }

    public func peek() -> T {
        return self.array[0]
    }

    public mutating func add(_ element: T) {
        self.array.append(element)
    }

    public mutating func next() -> T? {
        if self.array.count < 1 {
            return nil
        }
        let element = array.remove(at: 0)
        return element
    }
}
