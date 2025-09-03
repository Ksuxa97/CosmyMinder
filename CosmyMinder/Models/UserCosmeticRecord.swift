//
//  CosmeticItem.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 23.07.2025.
//
import Foundation

struct UserCosmeticRecord: Codable {
    let id: UUID
    let name: String
    let brand: String?
    let productionDate: Date
    let openDate: Date?
    let expiryDate: Date
    let imageURL: URL?
    let imageData: Data?

    func with(
        id: UUID? = nil,
        name: String? = nil,
        brand: String? = nil,
        productionDate: Date? = nil,
        openDate: Date? = nil,
        expiryDate: Date? = nil,
        imageURL: URL? = nil,
        imageData: Data? = nil
    ) -> UserCosmeticRecord {
        UserCosmeticRecord(
            id: id ?? self.id,
            name: name ?? self.name,
            brand: brand ?? self.brand,
            productionDate: productionDate ?? self.productionDate,
            openDate: openDate ?? self.openDate,
            expiryDate: expiryDate ?? self.expiryDate,
            imageURL: imageURL ?? self.imageURL,
            imageData: imageData ?? self.imageData
        )
    }
}
