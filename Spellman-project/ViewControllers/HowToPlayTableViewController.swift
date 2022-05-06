//
//  HowToPlayTableViewController.swift
//  Spellman-project
//
//  Created by Uzo Madueke on 01/05/2022.
//

import UIKit

class HowToPlayTableViewController: UITableViewController {
 
    var rulesTitle = rulesData.gamesRulesTitle
    var rules = rulesData.gamesRules
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = K.howTopPlayVCName
       // view.backgroundColor = UIColor(named: K.Colours.bgColour)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Play", style: .plain, target: self, action: #selector(goToGameScreen))
        
        tableView.reloadWithBounceAnimation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = " "
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rules.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.rulesCellName, for: indexPath)
        
        cell.textLabel?.text = rulesTitle[indexPath.row]
        cell.detailTextLabel?.text = rules[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc func goToGameScreen() {
        Vibration.light.vibrate()
        performSegue(withIdentifier: K.gameSeugue, sender: self)
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


