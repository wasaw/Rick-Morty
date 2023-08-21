//
//  CharacterSelectionPresenter.swift
//  Rick&Morty
//
//  Created by Александр Меренков on 17.08.2023.
//

import UIKit

final class CharacterSelectionPresenter: NSObject {
    
//    MARK: - Properties
    
    weak var input: CharacterSelectionInput?
    private let output: CharacterSelectionPresenterOutput

    private let serialHeroes = [SerialHero(name: "Rick Sanchez", image: UIImage(named: "rick")),
                                SerialHero(name: "Morty Smith", image: UIImage(named: "morty")),
                                SerialHero(name: "Summer Smith", image: UIImage(named: "summer")),
                                SerialHero(name: "Beth Smith", image: UIImage(named: "beth")),
                                SerialHero(name: "Rick Sanchez", image: UIImage(named: "rick")),
                                SerialHero(name: "Morty Smith", image: UIImage(named: "morty")),
                                SerialHero(name: "Summer Smith", image: UIImage(named: "summer")),
                                SerialHero(name: "Beth Smith", image: UIImage(named: "beth"))]
    
//    MARK: - Lifecycle
    
    init(output: CharacterSelectionPresenterOutput) {
        self.output = output
    }
}

// MARK: - CharacterSelectionOutput

extension CharacterSelectionPresenter: CharacterSelectionOutput {
    func showDetails() {
        output.showDetails()
    }
}

// MARK: - UICollectionViewDataSource

extension CharacterSelectionPresenter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return serialHeroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterSelectionCell.reuseIdentifire, for: indexPath) as? CharacterSelectionCell else { return UICollectionViewCell() }
        cell.configure(with: serialHeroes[indexPath.item])
        return cell
    }
}

