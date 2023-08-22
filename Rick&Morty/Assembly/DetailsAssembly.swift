//
//  DetailsAssembly.swift
//  Rick&Morty
//
//  Created by Александр Меренков on 21.08.2023.
//

import UIKit

final class DetailsAssembly {
    func makeDetailsModule(_ displayData: Character, network: NetworkServiceProtocol) -> UIViewController {
        let presenter = DetailsPresenter(character: displayData, network: network)
        let viewController = DetailsViewController(output: presenter)
        presenter.input = viewController
        return viewController
    }
}
