import Foundation

struct Deck: Codable {
    let cards: [Card]
}

struct Card: Codable {
    let image: URL
    let value: String
    let suit: String
}
