//
//  CharacterSelectionCell.swift
//  Rick&Morty
//
//  Created by Александр Меренков on 18.08.2023.
//

import UIKit

private enum Constans {
    static let imagePadding: CGFloat = 8
    static let nameLabelTop: CGFloat = 15
    static let cornerRadius: CGFloat = 10
}

final class CharacterSelectionCell: UICollectionViewCell {
    static let reuseIdentifire = "characterCell"
    
//    MARK: - Properties
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    
//    MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Helpers
    
    private func configureUI() {
        contentView.addSubview(profileImageView)
        profileImageView.anchor(leading: contentView.leadingAnchor,
                                top: contentView.topAnchor,
                                trailing: contentView.trailingAnchor,
                                paddingLeading: Constans.imagePadding,
                                paddingTop: Constans.imagePadding,
                                paddingTrailing: -Constans.imagePadding)
        
        contentView.addSubview(nameLabel)
        nameLabel.centerX(inView: contentView)
        nameLabel.anchor(top: profileImageView.bottomAnchor, paddingTop: Constans.nameLabelTop)
        
        layer.cornerRadius = Constans.cornerRadius
        backgroundColor = .cellBackground
    }
    
    func configure(with serialHero: SerialHero) {
        nameLabel.text = serialHero.name
        profileImageView.image = serialHero.image
    }
}
