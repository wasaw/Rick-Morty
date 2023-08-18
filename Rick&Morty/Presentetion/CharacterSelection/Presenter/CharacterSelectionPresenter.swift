//
//  CharacterSelectionPresenter.swift
//  Rick&Morty
//
//  Created by Александр Меренков on 17.08.2023.
//

import UIKit

private enum Constants {
    static let cellWidth: CGFloat = 156
    static let cellHeight: CGFloat = 202
}

final class CharacterSelectionPresenter: NSObject {
    
//    MARK: - Properties
    
    weak var input: CharacterSelectionInput?

}

// MARK: - CharacterSelectionOutput

extension CharacterSelectionPresenter: CharacterSelectionOutput {
    
}

// MARK: - UICollectionViewDataSource

extension CharacterSelectionPresenter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterSelectionCell.reuseIdentifire, for: indexPath)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CharacterSelectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.cellWidth, height: Constants.cellHeight)
    }
}
