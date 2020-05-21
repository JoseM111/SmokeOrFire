import UIKit

class CardViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var gameResultsLabel: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var higherButton: UIButton!
    @IBOutlet weak var lowerButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    //MARK: - Properties
    var currentValue    = 0
    var previousValue   = 0
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        gameResultsLabel.text = "Start Game!"
        fetchCardAndUpdateView()
        self.view.backgroundColor = UIColor(patternImage: UIImage(imageLiteralResourceName: "Felt.png"))
        
        cornerRadiusAdjuster()
    }
    
    //MARK: -Actions
    @IBAction func HigherButtonTapped(_ sender: Any) {
                CardController.fetchedCard { [weak self] result in
            
            DispatchQueue.main.async {
                
                switch result {
                    case .success(let card):
                        self?.fetchImageAndUpdateView(for: card)
                        self?.getValueFromString(for: card.value)
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
                        self?.getValueFromString(for: card.value)
                        self?.ifLower()
                    
                    case .failure(let error):
                        self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
    //MARK: Helper Methods
    func getValueFromString(for value: String) {
        switch value {
        case "ACE":
            currentValue = 14
            printf("Card Value: \(value)\n  Number in deck: \(currentValue)")
        case "KING":
            currentValue = 13
            printf("Card Value: \(value)\n  Number in deck: \(currentValue)")
        case "QUEEN":
            currentValue = 12
            printf("Card Value: \(value)\n  Number in deck: \(currentValue)")
        case "JACK":
            currentValue = 11
            printf("Card Value: \(value)\n  Number in deck: \(currentValue)")
        case "10":
            currentValue = 10
            printf("Card Value: \(value)\n  Number in deck: \(currentValue)")
        case "9":
            currentValue = 9
            printf("Card Value: \(value)\n  Number in deck: \(currentValue)")
        case "8":
            currentValue = 8
            printf("Card Value: \(value)\n  Number in deck: \(currentValue)")
        case "7":
            currentValue = 7
            printf("Card Value: \(value)\n  Number in deck: \(currentValue)")
        case "6":
            currentValue = 6
            printf("Card Value: \(value)\n  Number in deck: \(currentValue)")
        case "5":
            currentValue = 5
            printf("Card Value: \(value)\n  Number in deck: \(currentValue)")
        case "4":
            currentValue = 4
            printf("Card Value: \(value)\n  Number in deck: \(currentValue)")
        case "3":
            currentValue = 3
            printf("Card Value: \(value)\n  Number in deck: \(currentValue)")
        case "2":
            currentValue = 2
            printf("Card Value: \(value)\n  Number in deck: \(currentValue)")
        case "1":
            currentValue = 1
            printf("Card Value: \(value)\n  Number in deck: \(currentValue)")
        default:
            currentValue = 0
            printf("Card Value: \(value)\n  Number in deck: \(currentValue)")
        }
    }
    
    func getValueForStart(for value: String) {
               switch value {
                case "ACE": previousValue = 14
               case "KING": previousValue = 13
               case "QUEEN": previousValue = 12
               case "JACK": previousValue = 11
               case "10": previousValue = 10
               case "9": previousValue = 9
               case "8": previousValue = 8
               case "7": previousValue = 7
               case "6": previousValue = 6
               case "5": previousValue = 5
               case "4": previousValue = 4
               case "3": previousValue = 3
               case "2": previousValue = 2
               case "1": previousValue = 1
               default: previousValue = 0
               }
           }
    
    func fetchCardAndUpdateView() {
            CardController.fetchedCard { [weak self] (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let card):
                        self?.fetchImageAndUpdateView(for: card)
                        self?.getValueForStart(for: card.value)
                   case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                    }
                }
            }
        }
    
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
            previousValue = currentValue
        }
    }
    
    func ifLower() {
        
        if currentValue <= previousValue {
        self.gameResultsLabel.text = "YOU WIN!"
        previousValue = currentValue
    } else {
        self.gameResultsLabel.text = "Take A Shot!"
        previousValue = currentValue
        }
    }
    
    func cornerRadiusAdjuster() {
        higherButton.layer.cornerRadius = 5
        lowerButton.layer.cornerRadius = 5
        startButton.layer.cornerRadius = 5
    }
}// End of Class
