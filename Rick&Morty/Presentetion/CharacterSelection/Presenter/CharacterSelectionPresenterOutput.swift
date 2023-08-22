//
//  CharacterSelectionPresenterOutput.swift
//  Rick&Morty
//
//  Created by Александр Меренков on 21.08.2023.
//

import Foundation

protocol CharacterSelectionPresenterOutput: AnyObject {
    func showDetails(_ displayData: Character)
}
