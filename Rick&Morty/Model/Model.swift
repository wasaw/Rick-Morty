//
//  Model.swift
//  Rick&Morty
//
//  Created by Александр Меренков on 18.08.2023.
//

import UIKit

struct SerialHero {
    let name: String
    let image: UIImage?
}

struct CharacterAnswer: Decodable {
    let results: [Character]
}

struct Character: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let image: String
    let episode: [String]
}

struct Origin: Decodable {
    let name: String
    let url: String
}

struct Episode: Decodable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
}
