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
    
    //Mark - LifeCylce
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: -Actions
    @IBAction func HigherButtonTapped(_ sender: Any) {
    }
    
    @IBAction func lowerButtonTapped(_ sender: Any) {
    }
    

}
