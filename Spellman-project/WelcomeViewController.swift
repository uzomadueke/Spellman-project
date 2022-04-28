//
//  ViewController.swift
//  Spellman-project
//
//  Created by Uzo Madueke on 27/04/2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       // view.backgroundColor = .link  ...for console colour to be blue
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapButton(){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "gamepage") as? GameViewController else {
            print("failed to get vc from storyboard")
            return
            
        }
        
        present(vc, animated: true)
    }


}

