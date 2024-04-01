//
//  NetworkManager.swift
//  BreweryApp
//
//  Created by Dmitry Yastrebov on 01.04.2024.
//

import Foundation

final class NetworkManager {
    
    private func createURL() -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.openbrewerydb.org"
        components.path = "/v1/breweries"
        return components.url
    }
}
