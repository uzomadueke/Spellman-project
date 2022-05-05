//
//  AppDelegate.swift
//  Spellman-project
//
//  Created by Uzo Madueke on 27/04/2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let defaults = UserDefaults.standard
        
        var numberOfTimesOpened = defaults.integer(forKey: K.UserDefaultsKeys.noOfTimesAppOpened)
                
        numberOfTimesOpened += 1
        
        defaults.set(numberOfTimesOpened, forKey: "noTimesAppOpened")
        
        /*
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (notifcationsAllowed, error) in
            if error != nil {
                print(error ?? "Error setting up notifications!!")
            }
        }
        
        scheduleNotification()
        */
        
       // setUpNavBarFormatting()
        
        return true
    }
    
    // this for cutomizing the navigation bar, (the buttons and text).
    func setUpNavBarFormatting() {
        UINavigationBar.appearance().barTintColor = UIColor(named: K.Colours.bgColour)
        //UINavigationBar.appearance().tintColor = UIColor(named: K.Colours.buttonColour)
        //UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
        //                                                    NSAttributedString.Key.font: UIFont(name: K.Fonts.retroGaming, size: 22.0)!]
        UINavigationBar.appearance().isTranslucent = false
      //  UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: K.Fonts.retroGaming, size: 15.0)!], for: .normal)
    }
    

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

