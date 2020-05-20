import Foundation

struct Deck: Codable {
    let cards: [Card]
}

struct Card: Codable {
    let image: String
    let value: String
    let suit: String
}
