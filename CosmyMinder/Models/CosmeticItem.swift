//
//  CosmeticItem.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 23.07.2025.
//
import Foundation

struct CosmeticItem {
    let name: String
    let brand: String
    let productionDate: Date?
    let openDate: Date?
    let expiryDate: Date?
    let imageURL: URL?

    func with(
        name: String? = nil,
        brand: String? = nil,
        productionDate: Date? = nil,
        openDate: Date? = nil,
        expiryDate: Date? = nil,
        imageURL: URL? = nil
    ) -> CosmeticItem {
        CosmeticItem(
            name: name ?? self.name,
            brand: brand ?? self.brand,
            productionDate: productionDate ?? self.productionDate,
            openDate: openDate ?? self.openDate,
            expiryDate: expiryDate ?? self.expiryDate,
            imageURL: imageURL ?? self.imageURL
        )
    }
}
