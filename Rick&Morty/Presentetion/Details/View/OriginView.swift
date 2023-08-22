//
//  OriginView.swift
//  Rick&Morty
//
//  Created by Александр Меренков on 21.08.2023.
//

import UIKit

private enum Constants {
    static let cornerRadius: CGFloat = 15
    static let planetPadding: CGFloat = 10
    static let planetViewDimensions: CGFloat = 64
    static let planetImageDimensions: CGFloat = 24
    static let stackPadding: CGFloat = 20
    static let stackVerticalPadding: CGFloat = 10
}

final class OriginView: UIView {
    
//    MARK: - Properties
    
    private lazy var planetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "planet")
        return imageView
    }()
    private lazy var planetView: UIView = {
        let view = UIView()
        view.backgroundColor = .originViewBackground
        view.layer.cornerRadius = 10
        return view
    }()
    private lazy var originNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.textColor = .white
        return label
    }()
    private lazy var originTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Planet"
        label.textColor = .greenText
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
        addSubview(planetView)
        planetView.centerY(inView: self)
        planetView.anchor(leading: leadingAnchor,
                          paddingLeading: Constants.planetPadding,
                          width: Constants.planetViewDimensions,
                          height: Constants.planetViewDimensions)
        
        planetView.addSubview(planetImageView)
        planetImageView.centerX(inView: planetView)
        planetImageView.centerY(inView: planetView)
        planetImageView.anchor(width: Constants.planetImageDimensions, height: Constants.planetImageDimensions)
        
        let labelStack = UIStackView(arrangedSubviews: [originNameLabel, originTypeLabel])
        labelStack.axis = .vertical
        labelStack.distribution = .fillEqually
        addSubview(labelStack)
        labelStack.anchor(leading: planetView.trailingAnchor,
                          top: topAnchor,
                          trailing: trailingAnchor,
                          bottom: bottomAnchor,
                          paddingLeading: Constants.stackPadding,
                          paddingTop: Constants.stackVerticalPadding,
                          paddingTrailing: -Constants.stackPadding,
                          paddingBottom: -Constants.stackVerticalPadding)
        
        layer.cornerRadius = Constants.cornerRadius
        backgroundColor = .cellBackground
    }
    
    func setInformation(_ character: Character) {
        originNameLabel.text = character.origin.name
    }
}
