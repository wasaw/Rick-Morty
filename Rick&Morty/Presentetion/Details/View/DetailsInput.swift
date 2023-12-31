//
//  DetailsInput.swift
//  Rick&Morty
//
//  Created by Александр Меренков on 21.08.2023.
//

import Foundation

protocol DetailsInput: AnyObject {
    func showData(_ character: Character)
    func showEpisodes(_ height: CGFloat)
    func showAlert()
}
