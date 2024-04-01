//
//  BreweryError.swift
//  BreweryApp
//
//  Created by Dmitry Yastrebov on 01.04.2024.
//

import Foundation

enum BreweryError: Error {
    case invalidResponse
    case invalidStatusCode(Int)
    case decodingError
    case otherError(String)
}
