//
//  DataManagerProtocol.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 14.08.2025.
//

import Foundation

protocol DataManagerProtocol {
    func getCosmeticsList() -> [UserCosmeticRecord]
    func addCosmeticItem(_ item: UserCosmeticRecord)
    func editCosmeticItem(_ item: UserCosmeticRecord)
    func deleteCosmeticItem(with id: UUID)
}
