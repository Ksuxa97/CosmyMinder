//
//  NetworkService.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 22.08.2025.
//

import Foundation

enum APIConstants {
    static let baseURL: String = "https://world.openbeautyfacts.org"
}

enum Endpoint {
    case search(query: String)
    case barcode(code: String)

    var url: URL? {
        switch self {
        case .search(let query):
            var urlComponents = URLComponents(string: APIConstants.baseURL + "/cgi/search.pl")
            urlComponents?.queryItems = [
                URLQueryItem(name: "search_terms", value: query),
                URLQueryItem(name: "search_simple", value: "1"),
                URLQueryItem(name: "action", value: "process"),
                URLQueryItem(name: "json", value: "1")
            ]
            return urlComponents?.url
        case .barcode:
            return nil
        }
    }
}

final class NetworkService {
    func request<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let response = response as? HTTPURLResponse,
                  (200..<300).contains(response.statusCode) else {
                completion(.failure(NSError(domain: "Invalid response", code: 0, userInfo: nil)))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
