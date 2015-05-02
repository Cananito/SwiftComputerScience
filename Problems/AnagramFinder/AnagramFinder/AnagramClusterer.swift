//
//  AnagramClusterer.swift
//  AnagramFinder
//
//  Created by Rogelio Gudino on 2/14/15.
//  Copyright (c) 2015 Rogelio Gudino. All rights reserved.
//

func clusterArrayOfWords(words: [String]) -> [String: [String]] {
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

private func alphabetizeWord(word: String) -> String {
    if (word.isEmpty == true) {
        return word
    }
    
    let charactersArray = sorted(word.lowercaseString)
    let alphabetizedWord = reduce(charactersArray, "") { $0 + String($1) }
    return alphabetizedWord
}
