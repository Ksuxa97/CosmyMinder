//
//  DataManager.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 14.08.2025.
//

import Foundation

class DataManager: DataManagerProtocol {

    func getCosmeticsList() -> [CosmeticItem] {
        guard let data = UserDefaults.standard.data(forKey: "savedCosmetics") else { return [] }
        guard let savedCosmeticsList = try? JSONDecoder().decode([CosmeticItem].self, from: data) else { return [] }
        return savedCosmeticsList
    }

    func addCosmeticItem(_ item: CosmeticItem) {
        var savedCosmeticList = getCosmeticsList()
        savedCosmeticList.append(item)
        if let encodedData = try? JSONEncoder().encode(savedCosmeticList) {
            UserDefaults.standard.set(encodedData, forKey: "savedCosmetics")
        }
    }

    func deleteCosmeticItem(with id: UUID) {

    }
}
