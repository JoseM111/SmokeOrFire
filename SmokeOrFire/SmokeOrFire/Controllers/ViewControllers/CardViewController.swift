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
                    } else  if card.value == "ACE" {
                        self?.currentValue = 14
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
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
        //MARK: Helper Methods

    //MARK: Helper Methods

    func fetchImageAndUpdateView(for card: Card) {
        CardController.fetchImage(for: card) { [weak self]
            result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    //                    self?.gameResultsLabel.text = "Winner Take a Shot"
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
        currentValue = previousValue

        print(currentValue)
        print(previousValue)
        currentValue = 0
      } else {
        self.gameResultsLabel.text = "Take A Shot!"
        currentValue = previousValue
        currentValue = 0
            previousValue = currentValue
            print(currentValue)
            print(previousValue)
        } else {
            self.gameResultsLabel.text = "Take A Shot!"
            previousValue = currentValue
        }
    }
    
    func ifLower() {
        if currentValue <= previousValue {
            self.gameResultsLabel.text = "YOU WIN!"
            previousValue = currentValue
            print(currentValue)
            print(previousValue)
        } else {
            self.gameResultsLabel.text = "Take A Shot!"
            previousValue = currentValue
        }
    }
    
}// End of Class
