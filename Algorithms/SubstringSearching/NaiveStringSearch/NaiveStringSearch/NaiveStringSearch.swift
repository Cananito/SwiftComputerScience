//
//  NaiveStringSearch.swift
//  NaiveStringSearch
//
//  Created by Rogelio Gudino on 8/28/16.
//  Copyright © 2016 Rogelio Gudino. All rights reserved.
//

public func naiveStringSearch(substring: String, input: String) -> [Range<Int>] {
    if substring.characters.count < 1 || input.characters.count < 1 {
        return []
    }
    var results = [Range<Int>]()
    var currentStart = 0
    while let range = rangeOfFirstOccurrance(currentStart, substring: substring, input: input) {
        results.append(range)
        currentStart = range.endIndex
    }
    return results
}

private func rangeOfFirstOccurrance(start: Int, substring: String, input: String) -> Range<Int>? {
    if substring.characters.count < 1 || input.characters.count < 1 {
        return nil
    }
    
    if substring.characters.count > (input.characters.count - start) {
        return nil
    }
    
    var possibleMatchingStartIndex: String.CharacterView.Index?
    
    var currentInputIndex = input.startIndex.advancedBy(start)
    var currentSubstringIndex = substring.startIndex
    
    while currentSubstringIndex.distanceTo(substring.endIndex) > 0 && currentInputIndex.distanceTo(input.endIndex) > 0 {
        let currentInputCharacter = input.characters[currentInputIndex]
        let currentSubstringCharacter = substring.characters[currentSubstringIndex]
        
        if currentInputCharacter == currentSubstringCharacter {
            if possibleMatchingStartIndex == nil {
                possibleMatchingStartIndex = currentInputIndex
            }
            currentSubstringIndex = currentSubstringIndex.advancedBy(1)
        } else if possibleMatchingStartIndex != nil {
            possibleMatchingStartIndex = nil
            currentSubstringIndex = substring.startIndex
        }
        
        currentInputIndex = currentInputIndex.advancedBy(1)
    }
    
    if let matchingStartIndex = possibleMatchingStartIndex {
        let matchingStart = input.startIndex.distanceTo(matchingStartIndex)
        let matchingEnd = matchingStart + substring.characters.count
        return matchingStart..<matchingEnd
    }
    return nil
}
