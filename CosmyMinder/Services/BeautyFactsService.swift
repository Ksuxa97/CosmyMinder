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

        networkService.request(url: url) { (result: Result<BeautyProductSearchResponse, Error>) in
            switch result {
                case .success(let response):
                    completion(.success(response.products))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }

    func searchProduct(by barcode: String, completion: @escaping (Result<BeautyProduct, Error>) -> Void) {
        guard let url = Endpoint.barcode(code: barcode).url else {
            completion(.failure(NetworkError.invalidURL))
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

    func cosmeticInfo(from product: BeautyProduct) -> CosmeticInfo {
        var imageSource: ImageSource = .imageData(nil)
        if let urlString = product.imageURL, let url = URL(string: urlString) {
            imageSource = .url(url)
        } else {
            imageSource = .imageData(nil)
        }
        return CosmeticInfo(
            id: nil,
            name: product.name ?? product.genericName ?? "",
            brand: product.brand ?? "",
            productionDate: "",
            openDate: "",
            expiryDate: product.expiryDate ?? "",
            image: imageSource
        )
    }
}
