//
//  GameViewController.swift
//  Spellman-project
//
//  Created by Uzo Madueke on 28/04/2022.
//

import UIKit
import AVFoundation
import GameKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var hiddinWordLabel: UILabel!
    @IBOutlet weak var trysLabel: UILabel!  //guessesRemainingLabel
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet var keyboardbuttons: [UIButton]!
    @IBOutlet var playWord: UIButton!
    
    var player: AVAudioPlayer?
    
    let defaults = UserDefaults.standard
    var totalScore = 0 {
        didSet {
            defaults.set(totalScore, forKey: K.scoreKey)
        }
    }
    
   // let gameManager = GameDataManager()
    var wordLetterArray = [String]()
    var word = ""
    
    var maskedWord = ""
    var maskedWordArray = [String]()
    
    var wordStrings = [String]()
    var level = 0
    var levelCompleted = false
    var usedLetters = ""
    
    
    //This is for keeping the players score
    var score = 0 {
        didSet {
                pointsLabel.text = "\(score) points"
            }
        }
    
    
    //this shows how many tries the player has left
    var livesRemaining = 1 {
        didSet {
            trysLabel.text = "\(livesRemaining) lives left"
        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
