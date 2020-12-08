public func mergedIntersectingSets<T: Equatable>(sets: [Set<T>]) -> [Set<T>] {
  var mergedSets = sets
  if sets.count <= 1 {
    return mergedSets
  }

  var outerIndex = mergedSets.startIndex
  while outerIndex < (mergedSets.endIndex - 1) {
    var innerIndex = outerIndex.advanced(by: 1)
    while innerIndex < mergedSets.endIndex {
      let outerSet = mergedSets[outerIndex]
      let innerSet = mergedSets[innerIndex]
      if outerSet.isDisjoint(with: innerSet) == false {
        mergedSets[outerIndex].formUnion(innerSet)
        mergedSets.remove(at: innerIndex)
      } else {
        innerIndex = innerIndex.advanced(by: 1)
      }
    }

    outerIndex = outerIndex.advanced(by: 1)
  }

  return mergedSets
}
