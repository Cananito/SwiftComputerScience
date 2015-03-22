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
        
        var existingArray = wordsClusterDictionary[alphabetizedWord]
        var newArray = [String]()
        
        if let array = existingArray {
            newArray = array
            newArray.append(word)
        } else {
            newArray.append(word)
        }
        
        wordsClusterDictionary[alphabetizedWord] = newArray
    }
    
    return wordsClusterDictionary
}

private func alphabetizeWord(word: String) -> String {
    if (word.isEmpty == true) {
        return word
    }
    
    var lowercasedWord = word.lowercaseString
    
    var charactersArray = [String]()
    for character in lowercasedWord {
        charactersArray.append(String(character))
    }
    charactersArray = sorted(charactersArray, { (firstString: String, secondString: String) -> Bool in
        return firstString < secondString
    })
    
    var alphabetizedWord = ""
    
    for stringCharacter in charactersArray {
        alphabetizedWord += stringCharacter
    }
    
    return alphabetizedWord
}
