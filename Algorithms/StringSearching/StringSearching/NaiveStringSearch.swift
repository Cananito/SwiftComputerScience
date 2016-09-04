//
//  NaiveStringSearch.swift
//  StringSearching
//
//  Created by Rogelio Gudino on 8/28/16.
//  Copyright © 2016 Rogelio Gudino. All rights reserved.
//

public func naiveStringSearch(pattern: String, string: String) -> [Range<Int>] {
    if pattern.characters.count < 1 || string.characters.count < 1 {
        return []
    }
    var results = [Range<Int>]()
    var currentStart = 0
    while let range = rangeOfFirstOccurrance(currentStart, pattern: pattern, string: string) {
        results.append(range)
        currentStart = range.endIndex
    }
    return results
}

private func rangeOfFirstOccurrance(start: Int, pattern: String, string: String) -> Range<Int>? {
    if pattern.characters.count < 1 || string.characters.count < 1 {
        return nil
    }
    
    if pattern.characters.count > (string.characters.count - start) {
        return nil
    }
    
    var possibleMatchingStartIndex: String.CharacterView.Index?
    
    var currentStringIndex = string.startIndex.advancedBy(start)
    var currentPatternIndex = pattern.startIndex
    
    while currentPatternIndex.distanceTo(pattern.endIndex) > 0 && currentStringIndex.distanceTo(string.endIndex) > 0 {
        let currentStringCharacter = string.characters[currentStringIndex]
        let currentPatternCharacter = pattern.characters[currentPatternIndex]
        
        if currentStringCharacter == currentPatternCharacter {
            if possibleMatchingStartIndex == nil {
                possibleMatchingStartIndex = currentStringIndex
            }
            currentPatternIndex = currentPatternIndex.advancedBy(1)
        } else if possibleMatchingStartIndex != nil {
            possibleMatchingStartIndex = nil
            currentPatternIndex = pattern.startIndex
        }
        
        currentStringIndex = currentStringIndex.advancedBy(1)
    }
    
    if let matchingStartIndex = possibleMatchingStartIndex {
        let matchingStart = string.startIndex.distanceTo(matchingStartIndex)
        let matchingEnd = matchingStart + pattern.characters.count
        return matchingStart..<matchingEnd
    }
    return nil
}
