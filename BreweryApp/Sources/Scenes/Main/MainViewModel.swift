//
//  MainViewModel.swift
//  BreweryApp
//
//  Created by Dmitry Yastrebov on 01.04.2024.
//

import Foundation

protocol MainViewModelProtocol {
    var breweries: [Brewery] { get }
    func fetchBreweries(completion: @escaping (Result<[Brewery], BreweryError>) -> Void)
}

final class MainViewModel: MainViewModelProtocol {
    
    private var networkManager: NetworkManager
    var breweries: [Brewery] = []
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchBreweries(completion: @escaping (Result<[Brewery], BreweryError>) -> Void) {
        networkManager.getData { result in
            switch result {
            case .success(let data):
                let breweries = NetworkManager.decodeBreweryData(data)
                self.breweries = breweries
                completion(.success(breweries))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
