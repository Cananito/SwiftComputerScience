//
//  AnagramClusterer.swift
//  AnagramFinder
//
//  Created by Rogelio Gudino on 2/14/15.
//  Copyright (c) 2015 Rogelio Gudino. All rights reserved.
//

public func clusterArrayOfWords(_ words: [String]) -> [String: [String]] {
    var wordsClusterDictionary = [String: [String]]()
    
    for word in words {
        let alphabetizedWord = alphabetizeWord(word)
        if var existingArray = wordsClusterDictionary[alphabetizedWord] {
            existingArray.append(word)
            wordsClusterDictionary[alphabetizedWord] = existingArray
        } else {
            wordsClusterDictionary[alphabetizedWord] = [word]
        }
    }
    
    return wordsClusterDictionary
}

private func alphabetizeWord(_ word: String) -> String {
    if (word.isEmpty == true) {
        return word
    }
    
    let charactersArray = word.lowercased().characters.sorted()
    let alphabetizedWord = charactersArray.reduce("") { $0 + String($1) }
    return alphabetizedWord
}
