//
//  StableMarriageProblem.swift
//  StableMarriageProblem
//
//  Created by Rogelio Gudino on 11/22/18.
//  Copyright © 2018 Rogelio Gudino. All rights reserved.
//

public struct StableMarriageProblem {
    public typealias Identifier = String
    public typealias Preferences = [Identifier: [Identifier]]

    public static func solve(_ proposersPreferences: Preferences, _ recipientsPreferences: Preferences) -> [Identifier: Identifier]? {
        if proposersPreferences.count != recipientsPreferences.count {
            return nil
        }

        var result = [Identifier: Identifier]()
        var inverseResult = [Identifier: Identifier]()
        while result.count < proposersPreferences.count {
            for proposer in proposersPreferences.keys {
                // If the proposer is already matched, skip.
                if result[proposer] != nil {
                    continue
                }

                // Go over their ranking to propose to the best one.
                for choice in proposersPreferences[proposer]! {
                    if let competingProposer = inverseResult[choice] {
                        // Their choice is taken, can they upgrade?
                        let choicesRankings = recipientsPreferences[choice]!
                        let proposerRanking = choicesRankings.index(where: { $0 == proposer })!
                        let competingProposerRanking = choicesRankings.index(where: { $0 == competingProposer })!
                        if proposerRanking < competingProposerRanking {
                            // Upgrade!
                            result[proposer] = choice
                            inverseResult[choice] = proposer
                            // Remove competing proposer from result.
                            result[competingProposer] = nil
                            break
                        }
                    } else {
                        // Their choice is free, marry for now.
                        result[proposer] = choice
                        inverseResult[choice] = proposer
                        break
                    }
                }
            }
        }

        return result
    }
}

