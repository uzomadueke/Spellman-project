//
//  HowToPlayTableViewController.swift
//  Spellman-project
//
// Some of the code on this page is not mine, and was gotten from another programmer.
//

import UIKit

class HowToPlayTableViewController: UITableViewController {
 
    var rulesTitle = rulesData.gamesRulesTitle
    var rules = rulesData.gamesRules
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = K.howTopPlayVCName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Play", style: .plain, target: self, action: #selector(goToGameScreen)) // this creates a button that opens up the game page when clicked.
        
        tableView.reloadWithBounceAnimation() // this calls the animation function.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = " "
    }
    
    
    // this function creates rows for the amount 'gamesrules' stated in the rulesData struct.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rules.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.rulesCellName, for: indexPath)
        
        cell.textLabel?.text = rulesTitle[indexPath.row]  // this adds the data from the gameRulesTitle to the created rows.
        cell.detailTextLabel?.text = rules[indexPath.row]  // this adds the data from the gameRules to the created rows.
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // This function if for declaring the game screnn segue.
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


