//
//  CosmeticInfo.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 03.09.2025.
//

import Foundation

struct CosmeticInfo: Equatable {
    let name: String
    let brand: String
    let productionDate: String
    let openDate: String
    let expiryDate: String
    let image: ImageSource

    static func == (lhs: CosmeticInfo, rhs: CosmeticInfo) -> Bool {
        lhs.name == rhs.name
        && lhs.brand == rhs.brand
        && lhs.productionDate == rhs.productionDate
        && lhs.openDate == rhs.openDate
        && lhs.expiryDate == rhs.expiryDate
        && lhs.image == rhs.image
    }
}
