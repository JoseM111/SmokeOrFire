import Foundation
import UIKit.UIImage

class CardController {
    
    static let baseURl = URL(string: "https://deckofcardsapi.com/api/deck/new/draw")
    
    static func fetchedCard(completion: @escaping (Result<Card, CardError>) -> Void) {
        // 1 - Prepare URL
        guard let baseURL = baseURl else {return completion(.failure(.invalidURL))}
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let countItem = URLQueryItem(name: "count", value: "1")
        components?.queryItems = [countItem]
        guard let finalURL = components?.url else { return (completion(.failure(.invalidURL)))}
        
        // 2 - Contact server
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            // 3 - Handle errors from the server
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            // 4 - Check for json data
            guard let data = data else {return completion(.failure(.noData))}
            // 5 - Decode json into a Card
            do{
                let deck = try JSONDecoder().decode(Deck.self, from: data)
                guard let card = deck.cards.first else {return completion(.failure(.noData))}
                return completion(.success(card))
            } catch let decodingError {
                return completion(.failure(.thrownError(decodingError)))
                
            }
        } .resume()
    }
}


