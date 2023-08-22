//
//  DetailsViewController.swift
//  Rick&Morty
//
//  Created by Александр Меренков on 21.08.2023.
//

import UIKit

private enum Constants {
    static let profileImageDimensions: CGFloat = 148
    static let stackTop: CGFloat = 25
    static let stackSpacing: CGFloat = 15
    static let viewHorizontalPadding: CGFloat = 10
    static let paddingTop: CGFloat = 25
    static let infoHeight: CGFloat = 124
    static let originHeight: CGFloat = 80
    static let cellHeight: CGFloat = 86
    static let cellHorizontalPadding: CGFloat = 20
    static let lineSpacing: CGFloat = 20
    static let cornerRadius: CGFloat = 10
}

final class DetailsViewController: UIViewController {
    
//    MARK: - Properties
    
    private let output: DetailsOutput
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.anchor(width: Constants.profileImageDimensions,
                         height: Constants.profileImageDimensions)
        imageView.layer.cornerRadius = Constants.cornerRadius
        imageView.layer.masksToBounds = true
        return imageView
    }()
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 21)
        label.textColor = .white
        return label
    }()
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .greenText
        return label
    }()
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Info"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    private lazy var infoView = InfoView()
    private lazy var originLabel: UILabel = {
        let label = UILabel()
        label.text = "Origin"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    private lazy var originView = OriginView()
    private lazy var episodesLabel: UILabel = {
        let label = UILabel()
        label.text = "Episodes"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    
    private lazy var layout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
//    MARK: - Lifecycle
    
    init(output: DetailsOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.backItem?.title = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewIsReady()
        view.backgroundColor = .backgroundColor
    }
    
//    MARK: - Helpers
    
    private func configureUI(_ height: CGFloat) {
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: height)
        view.addSubview(scrollView)
        scrollView.anchor(leading: view.leadingAnchor,
                          top: view.safeAreaLayoutGuide.topAnchor,
                          trailing: view.trailingAnchor,
                          bottom: view.safeAreaLayoutGuide.bottomAnchor)

        scrollView.addSubview(contentView)
        contentView.anchor(leading: scrollView.contentLayoutGuide.leadingAnchor,
                           top: scrollView.contentLayoutGuide.topAnchor,
                           trailing: scrollView.contentLayoutGuide.trailingAnchor,
                           bottom: scrollView.contentLayoutGuide.bottomAnchor)
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [profileImageView, nameLabel, statusLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = Constants.stackSpacing
        contentView.addSubview(stackView)
        stackView.centerX(inView: contentView)
        stackView.anchor(top: contentView.safeAreaLayoutGuide.topAnchor, paddingTop: Constants.stackTop)
        
        contentView.addSubview(infoLabel)
        infoLabel.anchor(leading: contentView.leadingAnchor,
                        top: stackView.bottomAnchor,
                        trailing: contentView.trailingAnchor,
                        paddingLeading: Constants.viewHorizontalPadding,
                        paddingTop: Constants.paddingTop,
                        paddingTrailing: -Constants.viewHorizontalPadding)
        
        contentView.addSubview(infoView)
        infoView.anchor(leading: contentView.leadingAnchor,
                        top: infoLabel.bottomAnchor,
                        trailing: contentView.trailingAnchor,
                        paddingLeading: Constants.viewHorizontalPadding,
                        paddingTop: Constants.paddingTop,
                        paddingTrailing: -Constants.viewHorizontalPadding,
                        height: Constants.infoHeight)
        
        contentView.addSubview(originLabel)
        originLabel.anchor(leading: contentView.leadingAnchor,
                           top: infoView.bottomAnchor,
                           trailing: contentView.trailingAnchor,
                           paddingLeading: Constants.viewHorizontalPadding,
                           paddingTop: Constants.paddingTop,
                           paddingTrailing: -Constants.viewHorizontalPadding)
        
        contentView.addSubview(originView)
        originView.anchor(leading: contentView.leadingAnchor,
                          top: originLabel.bottomAnchor,
                          trailing: contentView.trailingAnchor,
                          paddingLeading: Constants.viewHorizontalPadding,
                          paddingTop: Constants.paddingTop,
                          paddingTrailing: -Constants.viewHorizontalPadding,
                          height: Constants.originHeight)
        
        contentView.addSubview(episodesLabel)
        episodesLabel.anchor(leading: contentView.leadingAnchor,
                             top: originView.bottomAnchor,
                             trailing: contentView.trailingAnchor,
                             paddingLeading: Constants.viewHorizontalPadding,
                             paddingTop: Constants.paddingTop,
                             paddingTrailing: -Constants.viewHorizontalPadding)
        
        collectionView.register(EpisodesCell.self, forCellWithReuseIdentifier: EpisodesCell.reuseIdentifire)
        contentView.addSubview(collectionView)
        collectionView.backgroundColor = .backgroundColor
        collectionView.delegate = self
        collectionView.dataSource = output
        collectionView.anchor(leading: contentView.leadingAnchor,
                              top: episodesLabel.bottomAnchor,
                              trailing: contentView.trailingAnchor,
                              bottom: contentView.bottomAnchor,
                              paddingTop: Constants.paddingTop,
                              height: height)
    }
}

// MARK: - DetailsInput

extension DetailsViewController: DetailsInput {
    func showData(_ character: Character) {
        nameLabel.text = character.name
        statusLabel.text = character.status
        profileImageView.imageFromUrl(character.image) {
        }
        infoView.setInformation(character)
        originView.setInformation(character)
    }
    
    func showEpisodes(_ height: CGFloat) {
        configureUI(height)
    }
}

// MARK: - UICollectionViewDelegate

extension DetailsViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension DetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.bounds.width - Constants.cellHorizontalPadding, height: Constants.cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.lineSpacing
    }
}
