//
//  CharacterSelectionAssembly.swift
//  Rick&Morty
//
//  Created by Александр Меренков on 17.08.2023.
//

import UIKit

final class CharacterSelectionAssembly {
    func makeCharacterModule(output: CharacterSelectionPresenterOutput, network: NetworkServiceProtocol) -> UINavigationController {
        let presenter = CharacterSelectionPresenter(output: output, network: network)
        let viewController = CharacterSelectionViewController(output: presenter)
        presenter.input = viewController
        let navigation = UINavigationController(rootViewController: viewController)
        return navigation
    }
}
