//
//  CharacherSelectionCoordinator.swift
//  Rick&Morty
//
//  Created by Александр Меренков on 21.08.2023.
//

import UIKit

final class CharacherSelectionCoordinator {
    
//    MARK: - Properties
    
    private let characterAssembly: CharacterSelectionAssembly
    private let detailsAssembly: DetailsAssembly
    
    private var navigation: UINavigationController? = nil
    
//    MARK: - Lifecycle
    
    init(characterAssembly: CharacterSelectionAssembly, detailsAssembly: DetailsAssembly) {
        self.characterAssembly = characterAssembly
        self.detailsAssembly = detailsAssembly
    }
    
//    MARK: - Helpers
    
    func start() -> UINavigationController {
        let viewController = characterAssembly.makeCharacterModule(output: self)
        navigation = viewController
        return viewController
    }
}

// MARK: - CharacterSelectionPresenterOutput

extension CharacherSelectionCoordinator: CharacterSelectionPresenterOutput {
    func showDetails() {
        let viewController = detailsAssembly.makeDetailsModule()
        navigation?.pushViewController(viewController, animated: true)
    }
}
