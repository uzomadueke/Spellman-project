//
//  ViewController.swift
//  Spellman-project
//
//  Created by Uzo Madueke on 27/04/2022.
//

import UIKit
import AVFoundation
import GameKit
import StoreKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameLogo: UIImageView!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var leaderboardButton: UIButton!
    @IBOutlet weak var howToPlayButton: UIButton!
    
    
    var player: AVAudioPlayer?
    let defaults = UserDefaults.standard
    var buttonClicked = false
    var soundFXOn = true
    var musicOn = true
    
    
    
    // This makes the navigation bar (top of the screen) dissappear, while on the home page.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        setNeedsStatusBarAppearanceUpdate()
      //  MusicPlayer.sharedHelper.playBGMusic()
        
        buttonClicked = false
        
        // for soundFX in homescreen
        if let soundFXStatus = defaults.bool(forKey: K.Audio.fxSoundKey) as? Bool {
            soundFXOn = soundFXStatus
        } else {
            soundFXOn = false //
        }
    }
    
    
    
    //This is for loading the homescreen.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the  line below if you want to play Background music
        MusicPlayer.sharedHelper.playBGMusic()
        
        animateViewController()
    }
    
    
    
    // This makes the navigation bar visible again (in the other pages).
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = " "
        navigationController?.isNavigationBarHidden = false
    }
    
    
    
    // This opens up the game page when the "play game" button is clicked.
    @IBAction func playButtonClicked(_ sender: UIButton){
        playButtonSound() // this is to play the button sound
        sender.pulsateBtn()
        sender.flashBtn() //
        
        Vibration.light.vibrate()  //adds vibration feature
        
        if !buttonClicked {
            DispatchQueue.main.asyncAfter(deadline: .now()  + 0.6) {
                [weak self] in
                self?.performSegue(withIdentifier: K.gameSeugue, sender: self)
            }
        }
        
        buttonClicked = true
    }
    
    
    
    // This opens up the how to play page when the "how to play" button is clicked.
    @IBAction func howToPlayButtonClicked(_ sender: UIButton){
        playButtonSound() // this is to play the button sound
        sender.pulsateBtn()
        
        Vibration.light.vibrate()  //adds vibration feature
        
        if !buttonClicked {
            DispatchQueue.main.asyncAfter(deadline: .now()  + 0.6) {
                [weak self] in
                self?.performSegue(withIdentifier: K.howToPlaySegue, sender: self)
            }
        }
        
        buttonClicked = true
    }
    
    
    
    // This opens up the leaderboard page when the "leaderboard" button is clicked.
    @IBAction func leaderboardButtonClicked(_ sender: UIButton){
        playButtonSound() // this is to play the button sound
        sender.pulsateBtn()
        
        Vibration.light.vibrate()  //adds vibration feature
        
        if !buttonClicked {
            DispatchQueue.main.asyncAfter(deadline: .now()  + 0.6) {
                [weak self] in
                self?.performSegue(withIdentifier: K.leaderboardSegue, sender: self)
            }
        }
        
        buttonClicked = true
    }
    
    
    
    // This opens up the settings page when the "settings" button is clicked.
    @IBAction func settingsButtonClicked(_ sender: UIButton){
        playButtonSound() // this is to play the button sound
        sender.pulsateBtn()
        
        Vibration.light.vibrate()  //adds vibration feature
        
        if !buttonClicked {
            DispatchQueue.main.asyncAfter(deadline: .now()  + 0.6) {
                [weak self] in
                self?.performSegue(withIdentifier: K.settingsSegue, sender: self)
            }
        }
        
        buttonClicked = true
    }
    
    
    
    
    
    // This function is for plying a sound when a button is clicked.
    func playButtonSound() {
     MusicPlayer.sharedHelper.playSound(soundURL: K.Audio.buttonPressedSound)
     }
    
    
    
    // This animates the Home screen as it launches, (buttons, text and logo included).
    private func animateViewController() {
        gameLogo.animateImg(duration: 2.0)
        gameTitle.typingTextAnimation(text: K.appName.uppercased(), timeInterval: 0.1)
        playButton.fadeInBtn(duration: 1.0)
        settingsButton.fadeInBtn(duration: 1.0)
        leaderboardButton.fadeInBtn(duration: 1.0)
        howToPlayButton.fadeInBtn(duration: 1.0)
    }


}


