//
//  InfoView.swift
//  Rick&Morty
//
//  Created by Александр Меренков on 21.08.2023.
//

import UIKit

private enum Constants {
    static let padding: CGFloat = 15
    static let stackStacing: CGFloat = 10
    static let cornerRadius: CGFloat = 15
}

final class InfoView: UIView {
    
//    MARK: - Properties
    private lazy var speciesLabel: UILabel = {
        let label = UILabel()
        label.text = "Species:"
        label.textColor = .lightGray
        return label
    }()
    private lazy var speciesInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Human"
        label.textColor = .white
        return label
    }()
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.text = "Type:"
        label.textColor = .lightGray
        return label
    }()
    private lazy var typeInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "None"
        label.textColor = .white
        return label
    }()
    private lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Gender:"
        label.textColor = .lightGray
        return label
    }()
    private lazy var genderInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Male"
        label.textColor = .white
        return label
    }()
    
//    MARK: - Lifecycle
    
    init() {
        super.init(frame: .zero)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Helpers
    
    private func configureUI() {
        let speciesStackView = UIStackView(arrangedSubviews: [speciesLabel, speciesInfoLabel])
        speciesStackView.distribution = .equalSpacing
        let typeStackView = UIStackView(arrangedSubviews: [typeLabel, typeInfoLabel])
        typeStackView.distribution = .equalSpacing
        let genderStackView = UIStackView(arrangedSubviews: [genderLabel, genderInfoLabel])
        genderStackView.distribution = .equalSpacing
        let infoStackView = UIStackView(arrangedSubviews: [speciesStackView, typeStackView, genderStackView])
        infoStackView.axis = .vertical
        infoStackView.distribution = .equalSpacing
        addSubview(infoStackView)
        infoStackView.anchor(leading: leadingAnchor,
                             top: topAnchor,
                             trailing: trailingAnchor,
                             bottom: bottomAnchor,
                             paddingLeading: Constants.padding,
                             paddingTop: Constants.padding,
                             paddingTrailing: -Constants.padding,
                             paddingBottom: -Constants.padding)
        
        layer.cornerRadius = Constants.cornerRadius
        backgroundColor = .cellBackground
    }
}
