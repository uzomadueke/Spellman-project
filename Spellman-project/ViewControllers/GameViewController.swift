//
//  GameViewController.swift
//  Spellman-project
//
//  
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
    
    var word = ""
    // These are the words that are going to be spelled.
    var wordLetterArray = ["APPLE", "BOOK", "CAT", "DOG", "ELEPHANT", "FISH", "GAZEBO", "HATFIELD", "INTERNATIONAL", "JUICE", "KID", "LOUNGE", "MONEY","NIGERIA", "OCTOBER", "PORTUGAL", "QUEEN", "ROAD", "SAUCE", "TIGER", "UMBRELLA", "VAN", "WATER", "XYLOPHONE", "YELLOW", "ZEBRA"]
    
    var hiddenWord = ""
    var hiddenWordArray = [Character]()

    var guess: Character!
    var usedLetters = [Character]()
    
  //  var level = 0 //
  //  var levelCompleted = false //
    
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
        
        // TotalPoints = defaults.integer(forKey: K.scoreKey)
        pointsLabel.text = "\(points) points" //
        trysLabel.text = "\(trys) Try Left"
    }

    
    
    // This function processes the letter entered by the user, when the 'SPELL' button is clicked.
    @IBAction func spellButtonClicked(_ sender: UIButton) {
        guessingTextField.becomeFirstResponder() // This opens up the keyboard when the text field is clicked
        
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
        trys = 1
        resetScreen()
    }
    
    
    //
    @IBAction func playWordClicked(_ sender: UIButton) {
        wordVoiceOver()
    }
    
    
    
    // This function clears the screen and selects a new word for the user to spell.
    @IBAction func nextWordButtonClicked(_ sender: UIButton) {
        view.backgroundColor = UIColor(red: 92/255, green: 157/255, blue: 232/255, alpha: 1) // changes background colour back to blue
      //  level += 1
      //+  levelCompleted = true
        
        // This resets the text field and the hiddenWords '?'
        guessingTextField.text = ""
        hiddenWord = ""
        word = wordLetterArray.randomElement()!            // This will randomise the selection of words for the user to spell.
        usedLetters = Array(word)
        
        for l in 1...word.count {
            hiddenWord += "?"
            hiddenWordLabel.text = hiddenWord
            hiddenWordArray = Array(hiddenWord)
        }
    }
    
    
    
    @IBAction func exitButtonClicked(_ sender: UIButton) {
        points = 0
        resetScreen()     // This resets the screen.
        
        if !buttonClicked {      // This triggers the the segue process and goes back to the home screen page.
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
                
                if guess == usedLetters[i] {  // This checks if the letter entered in the 'guessTextField'
                    hiddenWordArray[i] = guess
                    Vibration.success.vibrate()
                    playSound(sound: K.Audio.correctAnswerSound) // plays 'correct answer sound' if the letter is correct
                }
            }
        }
        else {
            if trys > 0 {
                trys -= 1  // This Reduces the amount of trys left to spell the word
                playSound(sound: K.Audio.wrongAnswerSound)  // plays 'wrong answer sound' if the letter is wrong
            }
        }
    }

    
    
    // This function checkes whether the user has spelled the 'hiddenWord' correctly, and updates the 'points' and 'try left' meters accordingly.
    func checkForWin() {
        
        if trys == 0 {
            if points != 0 {  // this does'nt allow to 'points' go below zero.
                points -= 4
            }
            view.backgroundColor = UIColor(red: 168/255, green: 4/255, blue: 14/255, alpha: 1) // Changes the background colour to red, when the user fails.
        }
        else if hiddenWord.contains("?") {
            
        }
        else {
            playSound(sound: K.Audio.gameWonSound)  // PLays winning sound.
            points += 4
            TotalPoints += 4
            view.backgroundColor = UIColor(red: 79/255, green: 178/255, blue: 105/255, alpha: 1) // Changes the background colour to green, when the player spells the word correctly.
        }
    }
    
    
    
    func resetScreen() {
        //Reset the variables, the labels, the images
        view.backgroundColor = UIColor(red: 92/255, green: 157/255, blue: 232/255, alpha: 1) // changes background colour back to blue
        guessingTextField.text = ""
        hiddenWord = ""
        usedLetters = Array(word)                                       // This will repeat the word for the user to spell it again.
       // points = 0
        
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
    
    //
    func playWord(play: String) {
        MusicPlayer.sharedHelper.playWord(playURL: play)
    }
    
    
    
//-------------------------------------------------------------------------------------------------------------
    

    
    
    
    // This is a function that will play the 'VoiceOver' if its name is equal to (==) the word meant to be spelled.
    func wordVoiceOver() {
        if K.VoiceOver.w1 == word {
            playWord(play: K.VoiceOver.w1) // this calls the audio file name listed in the constants file
        }
        else if K.VoiceOver.w2 == word {
            playWord(play: K.VoiceOver.w2) ///
        }
        else if K.VoiceOver.w3 == word {
            playWord(play: K.VoiceOver.w3) ///
        }
        else if K.VoiceOver.w4 == word {
            playWord(play: K.VoiceOver.w4) ///
        }
        else if K.VoiceOver.w5 == word {
            playWord(play: K.VoiceOver.w5) ///
        }
        else if K.VoiceOver.w6 == word {
            playWord(play: K.VoiceOver.w6) ///
        }
        else if K.VoiceOver.w7 == word {
            playWord(play: K.VoiceOver.w7) ///
        }
        else if K.VoiceOver.w8 == word {
            playWord(play: K.VoiceOver.w8) ///
        }
        else if K.VoiceOver.w9 == word {
            playWord(play: K.VoiceOver.w9) ///
        }
        else if K.VoiceOver.w10 == word {
            playWord(play: K.VoiceOver.w10) ///
        }
        else if K.VoiceOver.w11 == word {
            playWord(play: K.VoiceOver.w11) ///
        }
        else if K.VoiceOver.w12 == word {
            playWord(play: K.VoiceOver.w12) ///
        }
        else if K.VoiceOver.w13 == word {
            playWord(play: K.VoiceOver.w13) ///
        }
        else if K.VoiceOver.w14 == word {
            playWord(play: K.VoiceOver.w14) ///
        }
        else if K.VoiceOver.w15 == word {
            playWord(play: K.VoiceOver.w15) ///
        }
        else if K.VoiceOver.w16 == word {
            playWord(play: K.VoiceOver.w16) ///
        }
        else if K.VoiceOver.w17 == word {
            playWord(play: K.VoiceOver.w17) ///
        }
        else if K.VoiceOver.w18 == word {
            playWord(play: K.VoiceOver.w18) ///
        }
        else if K.VoiceOver.w19 == word {
            playWord(play: K.VoiceOver.w19) ///
        }
        else if K.VoiceOver.w20 == word {
            playWord(play: K.VoiceOver.w20) ///
        }
        else if K.VoiceOver.w21 == word {
            playWord(play: K.VoiceOver.w21) ///
        }
        else if K.VoiceOver.w22 == word {
            playWord(play: K.VoiceOver.w22) ///
        }
        else if K.VoiceOver.w23 == word {
            playWord(play: K.VoiceOver.w23) ///
        }
        else if K.VoiceOver.w24 == word {
            playWord(play: K.VoiceOver.w24) ///
        }
        else if K.VoiceOver.w25 == word {
            playWord(play: K.VoiceOver.w25) ///
        }
        else if K.VoiceOver.w26 == word {
            playWord(play: K.VoiceOver.w26) ///
        }
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
