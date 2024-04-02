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
        mainViewController.didSelectBrewery = { [weak self] brewery in
            self?.runDetail(with: brewery)
        }
        navigationController?.pushViewController(mainViewController, animated: true)
    }
    
    func runDetail(with brewery: Brewery) {
        let detailViewController = DetailViewController()
        let detailViewModel = DetailViewModel()
        detailViewModel.selectedBreweryItem = brewery
        detailViewController.configure(with: detailViewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
