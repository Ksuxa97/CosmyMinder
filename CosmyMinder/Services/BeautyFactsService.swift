//
//  BeautyFactsService.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 24.08.2025.
//

import Foundation

final class BeautyFactsService: BeautyFactsServiceProtocol {

    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func searchProducts(query: String, completion: @escaping (Result<[BeautyProduct], Error>) -> Void) {
        guard let url = Endpoint.search(query: query).url else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return
        }

        networkService.request(url: url) { (result: Result<BeautyProductSearchResponse, Error>) in
            switch result {
                case .success(let response):
                    completion(.success(response.products))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }

    func scanProduct(barcode: String, completion: @escaping (Result<BeautyProduct, Error>) -> Void) {
        guard let url = Endpoint.barcode(code: barcode).url else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return
        }

        networkService.request(url: url) { (result: Result<BeautyProductBarResponse, Error>) in
            switch result {
                case .success(let response):
                    completion(.success(response.product))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
