//
//  DataManagerProtocol.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 14.08.2025.
//

import Foundation

protocol DataManagerProtocol {
    func getCosmeticsList() -> [CosmeticItem]
    func addCosmeticItem(_ item: CosmeticItem)
    func deleteCosmeticItem(with id: UUID)
}
