//
//  DetailsPresenter.swift
//  Rick&Morty
//
//  Created by Александр Меренков on 21.08.2023.
//

import UIKit

private enum Constants {
    static let cellHeight: CGFloat = 86
}

final class DetailsPresenter: NSObject {
    
//    MARK: - Properties
    
    weak var input: DetailsInput?
}

// MARK: - DetailsOutput

extension DetailsPresenter: DetailsOutput {
    func viewIsReady() {
        let height: CGFloat = 327 * 5
        input?.showEpisodes(height)
    }
}

// MARK: - UICollectionViewDataSourse

extension DetailsPresenter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodesCell.reuseIdentifire, for: indexPath) as? EpisodesCell else { return UICollectionViewCell() }
        
        return cell
    }
}
