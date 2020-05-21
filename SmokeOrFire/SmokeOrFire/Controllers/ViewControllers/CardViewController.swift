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
    @IBOutlet weak var startButton: UILabel!
    
    
    
    //MARK: - Properties
    var currentValue    = 0
    var previousValue   = 0
    
    //MARK: - LifeCyclce
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(imageLiteralResourceName: "Felt.png"))
        
    }
    
    //MARK: -Actions
    
    @IBAction func StartButtonTapped(_ sender: Any) {
        CardController.fetchedCard { [weak self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let card):
                    self?.fetchImageAndUpdateView(for: card)
                    
                    if card.value == "QUEEN" {
                        self?.previousValue = 12
                        print(self!.previousValue)
                    } else if card.value == "KING" {
                        self?.previousValue = 13
                        print(self!.previousValue)
                    }  else if card.value == "JACK" {
                        self?.previousValue = 11
                        print(self!.previousValue)
                    } else if card.value == "ACE" {
                        self?.previousValue = 14
                        print(self!.previousValue)
                    } else if card.value == "1" {
                        self?.previousValue = 1
                        print(self!.previousValue)
                    } else if card.value == "2" {
                        self?.previousValue = 2
                        print(self!.previousValue)
                    } else if card.value == "3" {
                        self?.previousValue = 3
                        print(self!.previousValue)
                    } else if card.value == "4" {
                        self?.previousValue = 4
                        print(self!.previousValue)
                    } else if card.value == "5" {
                        self?.previousValue = 5
                        print(self!.previousValue)
                    } else if card.value == "6" {
                        self?.previousValue = 6
                        print(self!.previousValue)
                    } else if card.value == "7" {
                        self?.previousValue = 7
                        print(self!.previousValue)
                    } else if card.value == "7" {
                        self?.previousValue = 7
                        print(self!.previousValue)
                    } else if card.value == "8" {
                        self?.previousValue = 8
                        print(self!.previousValue)
                    } else if card.value == "9" {
                        self?.previousValue = 9
                        print(self!.previousValue)
                    } else if card.value == "10" {
                        self?.previousValue = 10
                        print(self!.previousValue)
                    } else {
                        let integer = (card.value as NSString).integerValue
                        print(integer)
                    }
                //                    self?.previousValue = Int(card.value) ?? 0
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
    @IBAction func HigherButtonTapped(_ sender: Any) {
        CardController.fetchedCard { [weak self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let card):
                    self?.fetchImageAndUpdateView(for: card)
                    
                    if card.value == "QUEEN" {
                        self?.currentValue = 12
                        print(self!.currentValue)
                    } else if card.value == "KING" {
                        self?.currentValue = 13
                        print(self!.currentValue)
                    }  else if card.value == "JACK" {
                        self?.currentValue = 11
                        print(self!.currentValue)
                    } else if card.value == "ACE" {
                        self?.currentValue = 14
                        print(self!.currentValue)
                    } else if card.value == "1" {
                        self?.currentValue = 1
                        print(self!.currentValue)
                    } else if card.value == "2" {
                        self?.currentValue = 2
                        print(self!.currentValue)
                    } else if card.value == "3" {
                        self?.currentValue = 3
                        print(self!.currentValue)
                    } else if card.value == "4" {
                        self?.currentValue = 4
                        print(self!.currentValue)
                    } else if card.value == "5" {
                        self?.currentValue = 5
                        print(self!.currentValue)
                    } else if card.value == "6" {
                        self?.currentValue = 6
                        print(self!.currentValue)
                    } else if card.value == "7" {
                        self?.currentValue = 7
                        print(self!.currentValue)
                    } else if card.value == "7" {
                        self?.currentValue = 7
                        print(self!.currentValue)
                    } else if card.value == "8" {
                        self?.currentValue = 8
                        print(self!.currentValue)
                    } else if card.value == "9" {
                        self?.currentValue = 9
                        print(self!.currentValue)
                    } else if card.value == "10" {
                        self?.currentValue = 10
                        print(self!.currentValue)
                    } else {
                        let integer = (card.value as NSString).integerValue
                        print(integer)
                    }
                    self?.ifHigher()
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
                    
                    if card.value == "QUEEN" {
                        self?.currentValue = 12
                        print(self!.currentValue)
                    } else if card.value == "KING" {
                        self?.currentValue = 13
                        print(self!.currentValue)
                    }  else if card.value == "JACK" {
                        self?.currentValue = 11
                        print(self!.currentValue)
                    } else if card.value == "ACE" {
                        self?.currentValue = 14
                        print(self!.currentValue)
                    } else if card.value == "1" {
                        self?.currentValue = 1
                        print(self!.currentValue)
                    } else if card.value == "2" {
                        self?.currentValue = 2
                        print(self!.currentValue)
                    } else if card.value == "3" {
                        self?.currentValue = 3
                        print(self!.currentValue)
                    } else if card.value == "4" {
                        self?.currentValue = 4
                        print(self!.currentValue)
                    } else if card.value == "5" {
                        self?.currentValue = 5
                        print(self!.currentValue)
                    } else if card.value == "6" {
                        self?.currentValue = 6
                        print(self!.currentValue)
                    } else if card.value == "7" {
                        self?.currentValue = 7
                        print(self!.currentValue)
                    } else if card.value == "7" {
                        self?.currentValue = 7
                        print(self!.currentValue)
                    } else if card.value == "8" {
                        self?.currentValue = 8
                        print(self!.currentValue)
                    } else if card.value == "9" {
                        self?.currentValue = 9
                        print(self!.currentValue)
                    } else if card.value == "10" {
                        self?.currentValue = 10
                        print(self!.currentValue)
                    } else {
                        let integer = (card.value as NSString).integerValue
                        print(integer)
                    }
                    
                    self?.ifLower()
                    
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
                    
                    //self?.gameResultsLabel.text = "Winner Take a Shot"
                    
                    //self?.gameResultsLabel.text = "Winner Take a Shot"
                    
                    self?.cardImage.image = image
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
    func ifHigher() {
        if currentValue >= previousValue {
            self.gameResultsLabel.text = "YOU WIN!"
            previousValue = currentValue
            
            
        } else {
            self.gameResultsLabel.text = "Take A Shot!"
            previousValue = currentValue         }     }
    func ifLower() {         if currentValue <= previousValue {             self.gameResultsLabel.text = "YOU WIN!"
        previousValue = currentValue
        
        
    } else {
        self.gameResultsLabel.text = "Take A Shot!"
        previousValue = currentValue
        
        
        }
        
    }

}// End of Class
