//
//  BeautyProduct.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 25.08.2025.
//

struct BeautyProductSearchResponse: Codable {
    let products: [BeautyProduct]
}

struct BeautyProduct: Codable {
    let name: String?
    let genericName: String?
    let brand: String?
    let expiryDate: String?
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case name = "product_name"
        case genericName = "generic_name"
        case brand = "brands"
        case expiryDate = "expiration_date"
        case imageURL = "image_url"
    }
}
