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
    
    private func createRequest(url: URL?) -> URLRequest? {
        guard let url else { return nil }
        let request = URLRequest(url: url)
        return request
    }
    
    func getData(handler: @escaping (Result<Data, BreweryError>) -> Void) {
        guard let url = createURL(), let urlRequest = createRequest(url: url) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                handler(.failure(.otherError(error.localizedDescription)))
                return
            }
            
            guard let data = data, let response = response as? HTTPURLResponse else {
                handler(.failure(.invalidResponse))
                return
            }
            
            switch response.statusCode {
            case 200:
                handler(.success(data))
            default:
                handler(.failure(.invalidStatusCode(response.statusCode)))
            }
        }.resume()
    }
    
    static func decodeBreweryData(_ data: Data) -> [Brewery] {
        let decoder = JSONDecoder()
        
        do {
            let result = try decoder.decode([Brewery].self, from: data)
            return result
        } catch {
            print(BreweryError.decodingError)
            return []
        }
    }
}
