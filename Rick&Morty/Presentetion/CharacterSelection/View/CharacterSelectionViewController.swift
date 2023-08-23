//
//  CharacterSelectionViewController.swift
//  Rick&Morty
//
//  Created by Александр Меренков on 17.08.2023.
//

import UIKit

private enum Constants {
    static let paddingLeading: CGFloat = 30
    static let paddingTrailing: CGFloat = -30
    static let activateTop: CGFloat = 15
    static let titleLabelTop: CGFloat = 25
    static let collectionViewTop: CGFloat = 20
    static let cellWidth: CGFloat = 156
    static let cellHeight: CGFloat = 202
}

final class CharacterSelectionViewController: UIViewController {
    
//    MARK: - Properties
    
    private let output: CharacterSelectionOutput
    
    private lazy var titleLable: UILabel = {
        let label = UILabel()
        label.text = "Characters"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 27)
        return label
    }()
    private lazy var layout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    private lazy var activateIndicator = UIActivityIndicatorView(style: .medium)

//    MARK: - Lifecycle
    
    init(output: CharacterSelectionOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        view.backgroundColor = .backgroundColor
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.tintColor = .white
    }
    
//    MARK: - Helpers
    
    private func configureUI() {
        view.addSubview(titleLable)
        titleLable.anchor(leading: view.leadingAnchor,
                          top: view.safeAreaLayoutGuide.topAnchor,
                          trailing: view.trailingAnchor,
                          paddingLeading: Constants.paddingLeading,
                          paddingTop: Constants.titleLabelTop,
                          paddingTrailing: Constants.paddingTrailing)
        
        collectionView.register(CharacterSelectionCell.self, forCellWithReuseIdentifier: CharacterSelectionCell.reuseIdentifire)
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = output
        collectionView.anchor(leading: view.leadingAnchor,
                              top: titleLable.bottomAnchor,
                              trailing: view.trailingAnchor,
                              bottom: view.bottomAnchor,
                              paddingLeading: Constants.paddingLeading,
                              paddingTop: Constants.collectionViewTop,
                              paddingTrailing: Constants.paddingTrailing)
        
        collectionView.addSubview(activateIndicator)
        activateIndicator.centerX(inView: collectionView)
        activateIndicator.anchor(top: collectionView.topAnchor, paddingTop: Constants.activateTop)
        activateIndicator.color = .white
        activateIndicator.startAnimating()
        collectionView.backgroundColor = .backgroundColor
    }
}

// MARK: - CharacterSelectionInput

extension CharacterSelectionViewController: CharacterSelectionInput {
    func showAlert() {
        let alert = UIAlertController(title: "Внимание", message: "Произошла непредвиденная ошибка, попробуйте снова", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default))
        present(alert, animated: true)
    }
    
    func reloadCollection() {
        collectionView.reloadData()
        activateIndicator.stopAnimating()
    }
}

// MARK: - UICollectionViewDelegate

extension CharacterSelectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output.showDetails(for: indexPath.item)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CharacterSelectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.cellWidth, height: Constants.cellHeight)
    }
}
