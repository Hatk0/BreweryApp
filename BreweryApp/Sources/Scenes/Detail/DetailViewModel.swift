//
//  DetailViewModel.swift
//  BreweryApp
//
//  Created by Dmitry Yastrebov on 02.04.2024.
//

import Foundation

protocol DetailViewModelProtocol {
    var name: String { get }
    var city: String { get }
    var state: String { get }
    var country: String { get }
}
