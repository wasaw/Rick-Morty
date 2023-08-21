//
//  Extensions.swift
//  Rick&Morty
//
//  Created by Александр Меренков on 18.08.2023.
//

import UIKit

// MARK: - UIColor

extension UIColor {
    static let backgroundColor = UIColor(displayP3Red: 4/255, green: 12/255, blue: 29/255, alpha: 1)
    static let cellBackground = UIColor(displayP3Red: 38/255, green: 42/255, blue: 55/255, alpha: 1)
    static let originViewBackground = UIColor(displayP3Red: 25/255, green: 28/255, blue: 42/255, alpha: 1)
    static let greenText = UIColor(displayP3Red: 77/255, green: 196/255, blue: 38/255, alpha: 1)
}

// MARK: - UIView

extension UIView {
    func anchor(leading: NSLayoutXAxisAnchor? = nil,
                top: NSLayoutYAxisAnchor? = nil,
                trailing: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                paddingLeading: CGFloat = 0,
                paddingTop: CGFloat = 0,
                paddingTrailing: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddingLeading).isActive = true
        }
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: paddingTrailing).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func centerX(inView view: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
    }
    
    func centerY(inView view: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }
}
