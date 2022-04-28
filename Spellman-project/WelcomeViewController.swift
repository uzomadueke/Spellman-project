//
//  ViewController.swift
//  Spellman-project
//
//  Created by Uzo Madueke on 27/04/2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameLogo: UIImageView!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var leaderboardButton: UIButton!
    @IBOutlet weak var howToPlayButton: UIButton!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       // view.backgroundColor = .link  ...for console colour to be blue
        
        // this is for animating the buttons on the welcome screen
        animateViewController()
    }
    
    @IBAction func didTapButton(){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "gamepage") as? GameViewController else {
            print("failed to get vc from storyboard")
            return
            
        }
        
        present(vc, animated: true)
    }
    
    
    
    
    
    
    
    
    private func animateViewController() {
        // Button animations
        gameTitle.typingTextAnimation(text: K.appName.uppercased(), timeInterval: 0.2)
        playButton.fadeInBtn(duration: 1.0)
        settingsButton.fadeInBtn(duration: 1.0)
        leaderboardButton.fadeInBtn(duration: 1.0)
        howToPlayButton.fadeInBtn(duration: 1.0)
    }


}


