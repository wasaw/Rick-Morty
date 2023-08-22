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
        
//        MARK: - Assembly
        let characterAssembly = CharacterSelectionAssembly()
        let detailsAssembly = DetailsAssembly()
        let network = NetworkService()
        let characterCoordinator = CharacherSelectionCoordinator(characterAssembly: characterAssembly,
                                                                 detailsAssembly: detailsAssembly,
                                                                 network: network)
        let rootViewController = characterCoordinator.start()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        return true
    }
}

