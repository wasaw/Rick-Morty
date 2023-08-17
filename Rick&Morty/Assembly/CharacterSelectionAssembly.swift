//
//  CharacterSelectionAssembly.swift
//  Rick&Morty
//
//  Created by Александр Меренков on 17.08.2023.
//

import UIKit

final class CharacterSelectionAssembly {
    func makeCharacterModule() -> UIViewController {
        let presenter = CharacterSelectionPresenter()
        let viewController = CharacterSelectionViewController(output: presenter)
        presenter.input = viewController
        return viewController
    }
}
