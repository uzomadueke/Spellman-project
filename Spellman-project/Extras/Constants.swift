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
    static let homePageSegue = "goToHome"
    static let winPopUpSegue = "openWinPopUp"
    static let losePopUpSegue = "openLosePopUp"
    
    // Score
    static let scoreKey = "Points"
    
    struct Audio {
        // Keys UserDefaults
        static let bgMusicKey = "Sound"
        static let fxSoundKey = "SoundFX"
        static let volumeKey = "Volume"
        static let VoiceOverKey = "Word" //
        
        // Music/sound constants
        static let bgMusic = "backgroundmusic"
        static let correctAnswerSound = "correct-answer"
        static let wrongAnswerSound = "wrong-answer"
        static let gameWonSound = "game-won"
        static let buttonPressedSound = "button-pressed"
    }
    
    // Voice Overs for the words to be spelled
    struct VoiceOver {
        static let w1 = "APPLE"
        static let w2 = "BOOK"
        static let w3 = "CAT"
        static let w4 = "DOG"
        static let w5 = "ELEPHANT"
        static let w6 = "FISH"
        static let w7 = "GAZEBO"
        static let w8 = "HATFIELD"
        static let w9 = "INTERNATIONAL"
        static let w10 = "JUICE"
        static let w11 = "KID"
        static let w12 = "LOUNGE"
        static let w13 = "MONEY"
        static let w14 = "NIGERIA"
        static let w15 = "OCTOBER"
        static let w16 = "PORTUGAL"
        static let w17 = "QUEEN"
        static let w18 = "ROAD"
        static let w19 = "SAUCE"
        static let w20 = "TIGER"
        static let w21 = "UMBRELLA"
        static let w22 = "VAN"
        static let w23 = "WATER"
        static let w24 = "XYLOPHONE"
        static let w25 = "YELLOW"
        static let w26 = "ZEBRA"
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


