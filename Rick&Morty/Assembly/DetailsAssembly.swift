//
//  DetailsAssembly.swift
//  Rick&Morty
//
//  Created by Александр Меренков on 21.08.2023.
//

import UIKit

final class DetailsAssembly {
    func makeDetailsModule() -> UIViewController {
        let presenter = DetailsPresenter()
        let viewController = DetailsViewController(output: presenter)
        presenter.input = viewController
        return viewController
    }
}
