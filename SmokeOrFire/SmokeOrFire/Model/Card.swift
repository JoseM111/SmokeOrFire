//
//  Card.swift
//  SmokeOrFire
//
//  Created by Ian Richins on 5/20/20.
//  Copyright © 2020 Jose Martinez. All rights reserved.
//

import Foundation

struct Deck: Codable {
    let cards: [Card]
}


struct Card: Codable {
    let image: String
    let value: String
    let suit: String
}
