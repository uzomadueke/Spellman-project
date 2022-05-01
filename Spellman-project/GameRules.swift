//
//  GameRules.swift
//  Spellman-project
//
//  Created by Uzo Madueke on 01/05/2022.
//

import Foundation

struct rulesData {
    
    static let gamesRulesTitle = [
        "1. The aim",
        "2. Guess the letter",
        "3. Lives",
        "4. Points",
        "5. Clues",
        "6. Winning"
    ]
    
    static let gamesRules = [
        "Guess the word before the hangman is hung and get as many points as you can.",
        "When you get a letter right you’ll see where that letter goes in the word.",
        "You start with 10 lives until the hangman is hung.",
        "You gain a point for correct guesses and loose a point for incorrect guesses.",
        "You get one clue per word, but you sacrifice a point and life for each clue.",
        "If you guess the word right, you can continue playing with a new word."
    ]
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


