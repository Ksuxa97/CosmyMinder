//
//  DataManager.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 14.08.2025.
//

import Foundation

class DataManager: DataManagerProtocol {

    private let cosmeticsListKey = "savedCosmetics"
    private let userDefaults: UserDefaults = .standard

    func getCosmeticsList() -> [UserCosmeticRecord] {
        guard let data = userDefaults.data(forKey: cosmeticsListKey) else { return [] }
        guard let savedCosmeticsList = try? JSONDecoder().decode([UserCosmeticRecord].self, from: data) else { return [] }
        return savedCosmeticsList
    }

    func addCosmeticItem(_ item: UserCosmeticRecord) -> Void {
        var savedCosmeticList = getCosmeticsList()
        savedCosmeticList.append(item)
        if let encodedData = try? JSONEncoder().encode(savedCosmeticList) {
            userDefaults.set(encodedData, forKey: cosmeticsListKey)
        }
    }

    func deleteCosmeticItem(with id: UUID) {

    }
}
