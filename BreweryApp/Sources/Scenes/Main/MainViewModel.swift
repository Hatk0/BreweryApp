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
