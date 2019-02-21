//
//  ViewController.swift
//  PlayingCard
//
//  Created by Lisa Watkins on 2/12/19.
//  Copyright © 2019 Lisa Watkins. All rights reserved.
//

import UIKit

/// PlayingCardView controller
class ViewController: UIViewController {
    
    var deck = PlayingCardDeck()
    
    /// Swipe to get next card
    @IBOutlet weak var playingCardView: PlayingCardView! {
        didSet {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left, .right]
            playingCardView.addGestureRecognizer(swipe)
        }
    }
    
    /// Tap to view the back of the card
    ///
    /// - Parameter sender: tap gesture
    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            playingCardView.isFaceUp = !playingCardView.isFaceUp
        default: break
        }
    }
    
    /// Update view with rank and suit from model
    @objc
    func nextCard() {
        if let card = deck.draw() {
            playingCardView.rank = card.rank.order
            playingCardView.suit = card.suit.rawValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

