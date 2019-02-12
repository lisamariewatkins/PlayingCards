//
//  ViewController.swift
//  PlayingCard
//
//  Created by Lisa Watkins on 2/12/19.
//  Copyright © 2019 Lisa Watkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var deck = PlayingCardDeck()

    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 1...10 {
            if let card = deck.draw() {
                print("\(card)")
            }
        }
    }
}

