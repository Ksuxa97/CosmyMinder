//
//  BeautyServiceProtocol.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 26.08.2025.
//

protocol BeautyFactsServiceProtocol {
    func searchProducts(query: String, completion: @escaping (Result<[BeautyProduct], Error>) -> Void)
    func searchProduct(by: String, completion: @escaping (Result<BeautyProduct, Error>) -> Void)
    func cosmeticInfo(from: BeautyProduct) -> CosmeticInfo
}
