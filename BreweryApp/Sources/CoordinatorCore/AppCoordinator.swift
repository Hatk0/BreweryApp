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
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    override func start() {
        let mainViewControllerCoordinator = MainViewControllerCoordinator(navigationController: navigationController)
        add(coordinator: mainViewControllerCoordinator)
        mainViewControllerCoordinator.start()
    }
}
