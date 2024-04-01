//
//  ViewController.swift
//  BreweryApp
//
//  Created by Dmitry Yastrebov on 29.03.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Coordinator
    
    weak var mainNavigationControllerCoordinator: MainViewControllerCoordinator?
    
    // MARK: - UI
    
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Brewery"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupHierarchy() {
        
    }
    
    private func setupLayout() {
        
    }
}

