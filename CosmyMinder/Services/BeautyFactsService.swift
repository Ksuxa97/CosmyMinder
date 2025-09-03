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
            completion(.failure(NetworkError.invalidURL))
            return
        }

        self.networkService.request(url: url) { (result: Result<BeautyProductSearchResponse, Error>) in
            DispatchQueue.main.async {
                switch result {
                    case .success(let response):
                        completion(.success(response.products))
                    case .failure(let error):
                        completion(.failure(error))
                }
            }
        }
    }

    func productToCosmeticInfo(product: BeautyProduct) -> CosmeticInfo {
        return CosmeticInfo(
            name: product.name ?? product.genericName ?? "",
            brand: product.brand ?? "",
            productionDate: "",
            openDate: "",
            expiryDate: product.expiryDate ?? "",
            imageURL: URL(string: product.imageURL ?? ""),
            imageData: nil
        )
    }
}
