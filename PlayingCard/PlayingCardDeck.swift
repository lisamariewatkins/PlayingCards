//
//  PlayingCardDeck.swift
//  PlayingCard
//
//  Created by Lisa Watkins on 2/12/19.
//  Copyright © 2019 Lisa Watkins. All rights reserved.
//

import Foundation

/// Deck of playing cards
struct PlayingCardDeck {
    private(set) var cards = [PlayingCard]()
    
    /// Initialize deck with all possible 52 playing cards
    init() {
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
    
    
    /// Draw a random card from the deck
    ///
    /// - Returns: random PlayingCard
    mutating func draw() -> PlayingCard? {
        if (cards.count > 0) {
            return cards.remove(at: cards.count.arc4random)
        } else {
            return nil
        }
    }
}


// MARK: - Extensions
extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}
