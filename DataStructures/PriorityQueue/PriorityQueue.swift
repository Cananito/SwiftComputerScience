public protocol PriorityQueue {
    associatedtype Element: Comparable
    init(leftIsHigherPriority: @escaping (Element, Element) -> Bool)
    func isEmpty() -> Bool
    func count() -> Int
    func peek() -> Element?
    mutating func insert(element: Element)
    mutating func remove() -> Element?
}
