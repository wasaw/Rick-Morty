//
//  DetailsViewController.swift
//  Rick&Morty
//
//  Created by Александр Меренков on 21.08.2023.
//

import UIKit

final class DetailsViewController: UIViewController {
    
//    MARK: - Properties
    
    private let output: DetailsOutput
    
//    MARK: - Lifecycle
    
    init(output: DetailsOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
    }
}

// MARK: - DetailsInput

extension DetailsViewController: DetailsInput {
    
}
