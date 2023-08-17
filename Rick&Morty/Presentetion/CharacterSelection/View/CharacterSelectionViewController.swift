//
//  CharacterSelectionViewController.swift
//  Rick&Morty
//
//  Created by Александр Меренков on 17.08.2023.
//

import UIKit

final class CharacterSelectionViewController: UIViewController {
    
//    MARK: - Properties
    
    private let output: CharacterSelectionOutput
    
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
        
        view.backgroundColor = .white
    }
}

// MARK: - CharacterSelectionInput

extension CharacterSelectionViewController: CharacterSelectionInput {
    
}
