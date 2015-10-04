
extension Array where Element: Comparable {
    public func binarySearch(value: Element) -> Element? {
        if self.count == 0 {
            return nil
        }
        return self.binarySearch(value, startIndex: 0, endIndex: (self.count - 1))
    }
    
    private func binarySearch(value: Element, startIndex: Int, endIndex: Int) -> Element? {
        let middleIndex = ((endIndex - startIndex) / 2) + startIndex
        let element = self[middleIndex]
        
        if element == value {
            return element
        }
        
        if startIndex == endIndex {
            return nil
        }
        
        if element > value {
            return self.binarySearch(value, startIndex: startIndex, endIndex: middleIndex)
        } else {
            return self.binarySearch(value, startIndex: (middleIndex + 1), endIndex: endIndex)
        }
    }
}

let a = [ 1, 3, 4, 7, 8, 10, 11, 30 ]
a.binarySearch(1)
a.binarySearch(2)
a.binarySearch(3)
a.binarySearch(4)
a.binarySearch(5)
a.binarySearch(7)
a.binarySearch(11)
a.binarySearch(12)
a.binarySearch(15)
a.binarySearch(30)
