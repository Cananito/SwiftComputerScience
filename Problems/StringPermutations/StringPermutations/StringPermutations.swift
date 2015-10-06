//
//  StringPermutations.swift
//  StringPermutations
//
//  Created by Rogelio Gudino on 10/5/15.
//  Copyright © 2015 Rogelio Gudino. All rights reserved.
//

extension String {
    func permutations() -> [String] {
        if self.characters.count == 0 {
            return []
        }
        
        if self.characters.count == 1 {
            return [self]
        }
        
        var permutations = [String]()
        for (index, character) in self.characters.enumerate() {
            var string = self
            let characterIndex = string.startIndex.advancedBy(index)
            string.removeAtIndex(characterIndex)
            let subPermutations = string.permutations()
            for subPermutation in subPermutations {
                let permutation = "\(character)\(subPermutation)"
                permutations.append(permutation)
            }
        }
        
        return permutations
    }
}
