//
//  DetailViewControllerCoordinator.swift
//  BreweryApp
//
//  Created by Dmitry Yastrebov on 02.04.2024.
//

import UIKit

class DetailViewControllerCoordinator: BaseCoordinator {
    
    private var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let detailViewController = DetailViewController()
        detailViewController.detailNavigationControllerCoordinator = self
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
