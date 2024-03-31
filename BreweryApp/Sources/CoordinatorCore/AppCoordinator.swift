//
//  AppCoordinator.swift
//  BreweryApp
//
//  Created by Dmitry Yastrebov on 31.03.2024.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    private var window: UIWindow
    
    // MARK: - Navigation Controller
    
    private var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()
    
    // MARK: - Initializers
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        // future realization
    }
}
