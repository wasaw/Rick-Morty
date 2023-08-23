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
    private let network: NetworkServiceProtocol

    private var characters: [Character] = []
    
//    MARK: - Lifecycle
    
    init(output: CharacterSelectionPresenterOutput, network: NetworkServiceProtocol) {
        self.output = output
        self.network = network
        super.init()
        load()
    }
    
//    MARK: - Helpers
    
    private func load() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        let request = URLRequest(url: url)
        network.loadData(request: request) { [weak self] (result: Result<CharacterAnswer, Error>) in
            switch result {
            case .success(let answer):
                self?.characters = answer.results
                DispatchQueue.main.async {
                    self?.input?.reloadCollection()
                }
            case .failure:
                DispatchQueue.main.async {
                    self?.input?.showAlert()
                }
            }
        }
    }
}

// MARK: - CharacterSelectionOutput

extension CharacterSelectionPresenter: CharacterSelectionOutput {
    func showDetails(for index: Int) {
        output.showDetails(characters[index])
    }
}

// MARK: - UICollectionViewDataSource

extension CharacterSelectionPresenter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterSelectionCell.reuseIdentifire, for: indexPath) as? CharacterSelectionCell else { return UICollectionViewCell() }
        cell.configure(with: characters[indexPath.item])
        return cell
    }
}

