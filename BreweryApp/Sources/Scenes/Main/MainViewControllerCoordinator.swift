//
//  MainViewControllerCoordinator.swift
//  BreweryApp
//
//  Created by Dmitry Yastrebov on 31.03.2024.
//

import UIKit

class MainViewControllerCoordinator: BaseCoordinator {
    
    private var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let mainViewController = MainViewController()
        mainViewController.mainNavigationControllerCoordinator = self
        navigationController?.pushViewController(mainViewController, animated: true)
    }
    
    func runDetail() {
        let secondViewControllerCoordinator = DetailViewControllerCoordinator(navigationController: navigationController)
        add(coordinator: secondViewControllerCoordinator)
        secondViewControllerCoordinator.start()
    }
}

