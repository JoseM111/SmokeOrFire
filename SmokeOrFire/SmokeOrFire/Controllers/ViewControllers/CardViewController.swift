//
//  CardViewController.swift
//  SmokeOrFire
//
//  Created by Ian Richins on 5/20/20.
//  Copyright © 2020 Jose Martinez. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var gameResultsLabel: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var higherButton: UIButton!
    @IBOutlet weak var lowerButton: UIButton!
    
    //MARK: - LifeCyclce
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO - Ian enter some code here

    }
    
    //MARK: -Actions
    @IBAction func HigherButtonTapped(_ sender: Any) {
        CardController.fetchedCard { [weak self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let card):
                    self?.fetchImageAndUpdateView(for: card)
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
                
            }
            
        }
    }
    
    @IBAction func lowerButtonTapped(_ sender: Any) {
        CardController.fetchedCard { [weak self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let card):
                    self?.fetchImageAndUpdateView(for: card)
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
                
            }
            
        }
    }
    
    //MARK: Helper Methods
    
    func fetchImageAndUpdateView(for card: Card) {
        CardController.fetchImage(for: card) { [weak self]
            result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self?.gameResultsLabel.text = "Winner Take a Shot"
                    self?.cardImage.image = image
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    

}// End of Class
