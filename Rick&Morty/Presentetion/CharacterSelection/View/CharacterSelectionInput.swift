//
//  CharacterSelectionInput.swift
//  Rick&Morty
//
//  Created by Александр Меренков on 17.08.2023.
//

import Foundation

protocol CharacterSelectionInput: AnyObject {
    func showAlert()
    func reloadCollection()
}
