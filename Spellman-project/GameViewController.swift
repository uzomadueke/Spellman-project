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
    
    @IBOutlet weak var hiddenWordLabel: UILabel!
    @IBOutlet weak var trysLabel: UILabel!  //guessesRemainingLabel
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var playWord: UIButton!   // make IBAcction func playWordClicked
    @IBOutlet weak var guessingTextField: UITextField!
    @IBOutlet weak var spellButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var tryAgainButton: UIButton!
    @IBOutlet weak var nextWordButton: UIButton!
    
    var player: AVAudioPlayer?
    let defaults = UserDefaults.standard
    var buttonClicked = false
    
    var wordLetterArray = ["CAT", "COOL", "SCHOOL", "APPLE"]
    var word = ""
    
    var hiddenWord = ""
    var hiddenWordArray = [Character]()

    var guess: Character!
    var usedLetters = [Character]()
    
    var level = 0
    var levelCompleted = false
    
    //This is for keeping the players score
    var points = 0 {
        didSet {
                pointsLabel.text = "\(points) points"
            }
        }
    
    //this shows how many tries the player has left
    var trys = 1 {
        didSet {
            trysLabel.text = "\(trys) Try Left"
        }
    }
    
    var TotalPoints = 0 {
        didSet {
            defaults.set(TotalPoints, forKey: K.scoreKey)
        }
    }
    
    
    
    //
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = K.appName
        
        //choose the word and assign to variable word
        word = wordLetterArray.randomElement()!
        usedLetters = Array(word)
        
        //set displayWord to the right number of question marks and put into diaplay word label
        for i in 1...word.count {
            hiddenWord += "?"
            hiddenWordLabel.text = hiddenWord
            hiddenWordArray = Array(hiddenWord)
        }
        
        TotalPoints = defaults.integer(forKey: K.scoreKey)
        pointsLabel.text = "\(points) points" //
        trysLabel.text = "\(trys) Try Left"
    }

    
    
    // This function processes the letter entered by the user, when the 'SPELL' button is clicked.
    @IBAction func spellButtonClicked(_ sender: UIButton) {
        //Resign first responder textField
        //guessingTextField.becomeFirstResponder()
        
        //Make sure the user has entered a letter but only one letter
        let guess1 = guessingTextField.text
        
        if guess1 == "" {
            guessingTextField.placeholder = "Enter a latter"
        }
        else if guess1!.count > 1 {
            guessingTextField.placeholder = "Enter one letter"
        }
        else {
            guess = Character(guessingTextField.text!.capitalized)
            checkForLetter()                                            //Calls the check for letter function.
            hiddenWord = String(hiddenWordArray)
            hiddenWordLabel.text = hiddenWord
            guessingTextField.text = ""
            checkForWin()                                               //Calls the check for win function.
        }
    }
    
    
    
    // Add this button to the pop up that appears when the player loses
    @IBAction func tryAgainButtonClicked(_ sender: UIButton) {
        resetScreen()
    }
    
    
    
    // This function clears the screen and selects a new word for the user to spell.
    @IBAction func nextWordButtonClicked(_ sender: UIButton) {
        level += 1
        levelCompleted = true
        
        //Reset the variables, the labels, the images
        guessingTextField.text = ""
        hiddenWord = ""
        word = wordLetterArray.randomElement()!                                       // This will repeat the word for the user to spell it again.
        usedLetters = Array(word)
        //points = 0
        
        for l in 1...word.count {
            hiddenWord += "?"
            hiddenWordLabel.text = hiddenWord
            hiddenWordArray = Array(hiddenWord)
        }
    }
    
    
    
    @IBAction func exitButtonClicked(_ sender: UIButton) {
        resetScreen()                                                                  // This resets the screen.
        
        if !buttonClicked {                                                            // This triggers the the segue process and goes back to the home screen page.
            DispatchQueue.main.asyncAfter(deadline: .now()  + 0.6) {
                [weak self] in
                self?.performSegue(withIdentifier: K.homePageSegue, sender: self)
            }
        }
        buttonClicked = true
    }
    
    
    
    // This function checks if the letter the user added, matches any of the letters in the 'hidden word'.
    func checkForLetter() {
        
        if usedLetters.contains(guess){
            for i in 0...word.count - 1 {
                
                if guess == usedLetters[i] {  // try and find why it get a runtime error
                    hiddenWordArray[i] = guess
                    Vibration.success.vibrate()
                    playSound(sound: K.Audio.correctAnswerSound) // plays 'correct answer sound' if the letter is correct
                }
            }
        }
        else {
            if trys == 0 {  // this does'nt allow to 'trys' go below zero.
                trys = 0
            }
            else {
                trys -= 1
            }
            
            playSound(sound: K.Audio.wrongAnswerSound)  // plays 'wrong answer sound' if the letter is wrong
        }
    }

    
    
    // This function checkes whether the user has spelled the 'hiddenWord' correctly, and updates the 'points' and 'try left' meters accordingly.
    func checkForWin() {
        
        if trys == 0 {
            if points == 0 {  // this does'nt allow to 'points' go below zero.
                points = 0
            }
            else {
                points -= 4
            }
            // call the pop up for losing
        }
        else if hiddenWord.contains("?") {
            
        }
        else {
            points += 4
            TotalPoints += 4
           // call the pop up for winning
           // nextWordButtonClicked()
        }
    }
    
    
    
    func resetScreen() {
        //Reset the variables, the labels, the images
        guessingTextField.text = ""
        hiddenWord = ""
        usedLetters = Array(word)                                       // This will repeat the word for the user to spell it again.
        points = 0
        
        for l in 1...word.count {
            hiddenWord += "?"
            hiddenWordLabel.text = hiddenWord
            hiddenWordArray = Array(hiddenWord)
        }
    }
    
    
    
    //
    func playSound(sound: String) {
        MusicPlayer.sharedHelper.playSound(soundURL: sound)
    }
    
    
    
//-------------------------------------------------------------------------------------------------------------

    
    
  // this is for adding the the voice overs to an array, add to spellman.  Find a way to link the voiceOverArray to wordArray so that when (w1) is chosen, (v1) is chosen simultaneously.
  /*
    func voiceOver() {
        let v1 = AVAudioplayer?(named: "word") ...
        
        let voiceOverArray = [v1, ...]
    }*/
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
