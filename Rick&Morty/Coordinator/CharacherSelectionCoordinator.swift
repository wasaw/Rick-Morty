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
    private let network: NetworkServiceProtocol
    
    private var navigation: UINavigationController? = nil
    
//    MARK: - Lifecycle
    
    init(characterAssembly: CharacterSelectionAssembly,
         detailsAssembly: DetailsAssembly,
         network: NetworkServiceProtocol) {
        self.characterAssembly = characterAssembly
        self.detailsAssembly = detailsAssembly
        self.network = network
    }
    
//    MARK: - Helpers
    
    func start() -> UINavigationController {
        let viewController = characterAssembly.makeCharacterModule(output: self, network: network)
        navigation = viewController
        return viewController
    }
}

// MARK: - CharacterSelectionPresenterOutput

extension CharacherSelectionCoordinator: CharacterSelectionPresenterOutput {
    func showDetails(_ displayData: Character) {
        let viewController = detailsAssembly.makeDetailsModule(displayData, network: network)
        navigation?.pushViewController(viewController, animated: true)
    }
}
