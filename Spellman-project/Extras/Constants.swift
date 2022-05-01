//
//  Constants.swift
//  Spellman-project
//
//  Created by Uzo Madueke on 28/04/2022.
//

import Foundation

struct K {
    
    // VC Titles
    static let appName = "Spellman"
    static let settingsVCName = "Settings ⚙️"
    static let howTopPlayVCName = "How To Play 🕹"
    
    // Hangman image name
    static let hangmanImg = "hangman"
    
    // Segues
    static let gameSeugue = "goToGame"
    static let howToPlaySegue = "goToHowToPlay"
    static let settingsSegue = "goToSettings"
    static let leaderboardSegue = "goToLeaderboard"
    
    // Score
    static let scoreKey = "TotalScore"
    
    struct Audio {
        // Keys UserDefaults
        static let bgMusicKey = "Sound"
        static let fxSoundKey = "SoundFX"
        static let volumeKey = "Volume"
        
        // Music/sound constants
        static let bgMusic = "backgroundmusic"
        static let correctAnswerSound = "correct-answer"
        static let wrongAnswerSound = "wrong-answer"
        static let gameWonSound = "game-won"
        static let buttonPressedSound = "button-pressed"
    }
    
    struct Fonts {
        static let futuraBold = "FuturaBold"
        static let futuraBook = "FuturaBook"
    }
    
    struct Colours {
        static let bgColour = "packground"
        static let buttonColour = "PinkColour"
        static let highlightColour = "TurquoiseColour"
        static let labelColour = "WhiteColour"
    }
    
    struct wordsURL {
        static let fileName = "words"
        static let fileExtension = "txt"
    }
    
    // TableVIew Cells
    static let rulesCellName = "rulesCell"
    
    //MARK: - UserDefaults
    struct UserDefaultsKeys {
        static let noOfTimesAppOpened = "noTimesAppOpened"
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


