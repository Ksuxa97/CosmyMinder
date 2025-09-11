//
//  CosmeticListPresenter.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 23.07.2025.
//

import Foundation
import UIKit

final class CosmeticListPresenter: CosmeticListPresenterProtocol {
    weak var view: CosmeticListViewProtocol?
    var numberOfItems: Int {
        cosmeticItems.count
    }
    
    private var cosmeticItems: [UserCosmeticRecord] = []
    private let dataManager: DataManagerProtocol

    init(dataManager: DataManagerProtocol) {
        self.dataManager = dataManager
        cosmeticItems = dataManager.getCosmeticsList()
    }

    func updateCosmeticList() {
        cosmeticItems = dataManager.getCosmeticsList()
    }

    func getCosmeticItem(at index: Int) -> UserCosmeticRecord? {
        guard index >= 0 && index < cosmeticItems.count else {
            return nil
        }
        return cosmeticItems[index]
    }

    func didSelectCosmeticItem(at index: Int) {
        guard index >= 0 && index < cosmeticItems.count else {
            view?.showAlert()
            return
        }
        let info = recordToCosmeticInfo(item: cosmeticItems[index])
        view?.navigateToProductDetails(with: info)
    }

    func deleteUserRecord(at index: Int) {
        dataManager.deleteCosmeticItem(with: cosmeticItems[index].id)
        cosmeticItems.remove(at: index)
    }

    private func recordToCosmeticInfo(item: UserCosmeticRecord) -> CosmeticInfo {
        var openDateString: String = ""
        if let openDate = item.openDate {
            openDateString = DateFormatter().string(from: openDate)
        }

        return CosmeticInfo(
            name: item.name,
            brand: item.brand ?? "",
            productionDate: DateFormatter().string(from: item.productionDate),
            openDate: openDateString,
            expiryDate: DateFormatter().string(from: item.expiryDate),
            imageURL: item.imageURL,
            imageData: item.imageData
        )
    }
}
