//
//  AppDelegate.swift
//  Rick&Morty
//
//  Created by Александр Меренков on 17.08.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

// MARK: - Properties
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        window.rootViewController = ViewController()
        window.makeKeyAndVisible()
        
        return true
    }
}

