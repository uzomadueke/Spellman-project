//
//  MusicPlayer.swift
//  Spellman-project
//
//  Some of the code on this page is not mine, and was gotten from another programmer.
//

import Foundation
import AVFoundation

class MusicPlayer {
    
    static let sharedHelper = MusicPlayer()
    var audioPlayer: AVAudioPlayer?
    
    let defaults = UserDefaults.standard
    lazy var musicOn = defaults.object(forKey: K.Audio.bgMusicKey) as? Bool ?? true
    lazy var fxSoundOn = defaults.object(forKey: K.Audio.fxSoundKey) as? Bool ?? true
    lazy var volume = defaults.object(forKey: K.Audio.volumeKey) as? Float ?? 1.0
    lazy var playWord = defaults.object(forKey: K.Audio.VoiceOverKey) as? Bool ?? true
    
    
    
    // This is for playing the background music
    func playBGMusic() {
        let bgMusicURL = NSURL(fileURLWithPath: Bundle.main.path(forResource: K.Audio.bgMusic, ofType: "mp3")!)
        
        if musicOn {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: bgMusicURL as URL)
                audioPlayer?.numberOfLoops = -1  // this creates an infinie loop for the music
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
                audioPlayer?.volume = volume 
                print("playing music")
            } catch {
                print("Issue playing music file")
            }
        } else {
            audioPlayer?.stop()
            return
        }
    }
    
    
    
    // This is for playing the sounds for particular buttons
    func playSound(soundURL: String) {
        
        let soundURL = NSURL(fileURLWithPath: Bundle.main.path(forResource: soundURL, ofType: "wav")!)
        
        if fxSoundOn {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL as URL)
                audioPlayer?.numberOfLoops = 0
                audioPlayer?.prepareToPlay()
                audioPlayer?.volume = 0.3
                audioPlayer?.play()
            } catch {
                print("Error playing FX Sounds")
            }
            
        } else {
            audioPlayer?.stop()
            return
        }
    }
    
    
 // Below. This part of the code is mine, i used the knowledge from above to create it.
    
    // This is for playing the sounds for particular voiceovers
    func playWord(playURL: String) {
        
        let playURL = NSURL(fileURLWithPath: Bundle.main.path(forResource: playURL, ofType: "wav")!)
        
        if fxSoundOn {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: playURL as URL)
                audioPlayer?.numberOfLoops = 0
                audioPlayer?.prepareToPlay()
                audioPlayer?.volume = volume
                audioPlayer?.play()
            } catch {
                print("Could not play the voice over for the words")
            }
            
        } else {
            audioPlayer?.stop()
            return
        }
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


