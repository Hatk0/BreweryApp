//
//  BaseCoordinator.swift
//  BreweryApp
//
//  Created by Dmitry Yastrebov on 31.03.2024.
//

import Foundation

class BaseCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    func start() {
        fatalError("Child should implement func start")
    }
}
