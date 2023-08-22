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
    private let character: Character
    private let network: NetworkServiceProtocol
    
//    MARK: - Lifecycle
    
    init(character: Character, network: NetworkServiceProtocol) {
        self.character = character
        self.network = network
    }
}

// MARK: - DetailsOutput

extension DetailsPresenter: DetailsOutput {
    func viewIsReady() {
        input?.showData(character)
        let height: CGFloat = Constants.cellHeight * CGFloat(character.episode.count)
        input?.showEpisodes(height)
    }
}

// MARK: - UICollectionViewDataSourse

extension DetailsPresenter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return character.episode.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodesCell.reuseIdentifire, for: indexPath) as? EpisodesCell else { return UICollectionViewCell() }
        guard let url = URL(string: character.episode[indexPath.item]) else { return UICollectionViewCell() }
        let request = URLRequest(url: url)
        network.loadData(request: request) { (result: Result<Episode, Error>) in
            switch result {
            case .success(let episode):
                DispatchQueue.main.async {
                    cell.setInformation(episode)
                }
            case .failure:
                print("DEBUG: failure")
            }
        }
        return cell
    }
}
