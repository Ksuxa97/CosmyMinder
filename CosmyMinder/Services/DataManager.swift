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

    func getCosmeticsList() -> [CosmeticItem] {
        guard let data = userDefaults.data(forKey: cosmeticsListKey) else { return [] }
        guard let savedCosmeticsList = try? JSONDecoder().decode([CosmeticItem].self, from: data) else { return [] }
        return savedCosmeticsList
    }

    func addCosmeticItem(_ item: CosmeticItem) -> Void {
        var savedCosmeticList = getCosmeticsList()
        savedCosmeticList.append(item)
        if let encodedData = try? JSONEncoder().encode(savedCosmeticList) {
            userDefaults.set(encodedData, forKey: cosmeticsListKey)
        }
    }

    func deleteCosmeticItem(with id: UUID) {

    }
}
