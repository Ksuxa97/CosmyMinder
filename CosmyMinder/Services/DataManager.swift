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

    func addCosmeticItem(_ item: UserCosmeticRecord) {
        var savedCosmeticList = getCosmeticsList()
        savedCosmeticList.append(item)
        guard let encodedData = try? JSONEncoder().encode(savedCosmeticList) else { return }
        userDefaults.set(encodedData, forKey: cosmeticsListKey)
    }

    func editCosmeticItem(_ item: UserCosmeticRecord) {
        var savedCosmeticList = getCosmeticsList()

        guard let index = savedCosmeticList.firstIndex(where: { $0.id == item.id }) else { return }
        savedCosmeticList[index] = item

        guard let encodedData = try? JSONEncoder().encode(savedCosmeticList) else { return }
        userDefaults.set(encodedData, forKey: cosmeticsListKey)
    }

    func deleteCosmeticItem(with id: UUID) {
        var savedCosmeticList = getCosmeticsList()
        savedCosmeticList.removeAll { $0.id == id }
        guard let encodedData = try? JSONEncoder().encode(savedCosmeticList) else { return }
        userDefaults.set(encodedData, forKey: cosmeticsListKey)
    }
}
