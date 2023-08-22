//
//  EpisodesCell.swift
//  Rick&Morty
//
//  Created by Александр Меренков on 21.08.2023.
//

import UIKit

private enum Constants {
    static let paddings: CGFloat = 15
    static let cornerRadius: CGFloat = 15
}

final class EpisodesCell: UICollectionViewCell {
    static let reuseIdentifire = "episodesCell"
    
//    MARK: - Properties
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.textColor = .white
        return label
    }()
    private lazy var serialNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .greenText
        return label
    }()
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .lightGray
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
    
//    MARK: -  Helpers
    
    private func configureUI() {
        contentView.addSubview(titleLabel)
        titleLabel.anchor(leading: contentView.leadingAnchor,
                          top: contentView.topAnchor,
                          trailing: contentView.trailingAnchor,
                          paddingLeading: Constants.paddings,
                          paddingTop: Constants.paddings,
                          paddingTrailing: -Constants.paddings)
        
        contentView.addSubview(serialNumberLabel)
        serialNumberLabel.anchor(leading: contentView.leadingAnchor,
                                 bottom: contentView.bottomAnchor,
                                 paddingLeading: Constants.paddings,
                                 paddingBottom: -Constants.paddings)
        
        contentView.addSubview(dateLabel)
        dateLabel.anchor(trailing: contentView.trailingAnchor,
                         bottom: contentView.bottomAnchor,
                         paddingTrailing: -Constants.paddings,
                         paddingBottom: -Constants.paddings)
        
        layer.cornerRadius = Constants.cornerRadius
        backgroundColor = .cellBackground
    }
    
    func setInformation(_ episode: Episode) {
        titleLabel.text = episode.name
        var start = episode.episode.index(episode.episode.startIndex, offsetBy: 1)
        var end = episode.episode.index(start, offsetBy: 1)
        var range = start...end
        let seasonSubString = episode.episode[range]
        let season = String(seasonSubString)
        start = episode.episode.index(episode.episode.startIndex, offsetBy: 4)
        end = episode.episode.index(start, offsetBy: 1)
        range = start...end
        let seriesSubString = episode.episode[range]
        let series = String(seriesSubString)
        serialNumberLabel.text = "Episode: \(series), Season: \(season)"
        dateLabel.text = episode.airDate
    }
}
