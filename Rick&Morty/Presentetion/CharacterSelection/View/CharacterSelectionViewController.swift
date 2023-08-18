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
    static let titleLabelTop: CGFloat = 25
    static let collectionViewTop: CGFloat = 20
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
                              bottom: view.safeAreaLayoutGuide.bottomAnchor,
                              paddingLeading: Constants.paddingLeading,
                              paddingTop: Constants.collectionViewTop,
                              paddingTrailing: Constants.paddingTrailing)
        collectionView.backgroundColor = .backgroundColor
    }
}

// MARK: - CharacterSelectionInput

extension CharacterSelectionViewController: CharacterSelectionInput {
    
}

// MARK: - UICollectionViewDelegate

extension CharacterSelectionViewController: UICollectionViewDelegate {
    
}
