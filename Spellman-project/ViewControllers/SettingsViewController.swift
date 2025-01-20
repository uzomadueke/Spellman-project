//
//  SettingsViewController.swift
//  Spellman-project
//
// 
//

import UIKit
import AVFoundation

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var soundFXTag: UILabel!
    @IBOutlet weak var soundFXController: UISwitch!
    @IBOutlet weak var musicTag: UILabel!
    @IBOutlet weak var musicController: UISwitch!
    
    let defaults = UserDefaults.standard
    var soundFXOn = true
    var musicOn = true
    var currentVolume: Float = 1.0
    
    var player: AVAudioPlayer?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = K.settingsVCName
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // the following is for controlling the soundFX function.
        soundFXTag.alpha = 0
        
        UIView.animate(withDuration: 1.0) {
            self.soundFXTag.alpha = 1.0
        }
        
        soundFXOn = defaults.bool(forKey: "SoundFX")
        currentVolume = defaults.float(forKey: "Volume")
        
        soundFXController.setOn(soundFXOn, animated: true)
        
        
        // The following is for controlling the music function.
        musicTag.alpha = 0
        
        UIView.animate(withDuration: 1.0) {
            self.musicTag.alpha = 1.0
        }
        
        musicOn = defaults.bool(forKey: "Sound")
        currentVolume = defaults.float(forKey: "Volume")
        
        musicController.setOn(musicOn, animated: true)
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = " "
       // MusicPlayer.sharedHelper.playBGMusic()
    }
    
    
    
    // This controlls the soundFX switch
    @IBAction func soundFXController(_ sender: UISwitch){
        if sender.isOn == true {
            defaults.set(true, forKey: "SoundFX")
            playButtonSound()
        } else {
            defaults.set(false, forKey: "SoundFX")
        }
    }
    
    
    
    // this controlls the music switch
    @IBAction func musicController(_ sender: UISwitch){
        if sender.isOn == true {
            defaults.set(true, forKey: "Sound")
            MusicPlayer.sharedHelper.playBGMusic()
        } else {
            defaults.set(false, forKey: "Sound")
          //  MusicPlayer.sharedHelper.playBGMusic.pause()
        }
    }
    
    
    
    // This is used to play the button sounds.
    private func playButtonSound() {
        MusicPlayer.sharedHelper.playSound(soundURL: K.Audio.buttonPressedSound)
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
