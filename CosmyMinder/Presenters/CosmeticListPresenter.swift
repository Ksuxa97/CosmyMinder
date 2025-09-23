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
        let info = сosmeticInfo(from: cosmeticItems[index])
        view?.navigateToProductDetails(with: info)
    }

    func deleteCosmeticRecord(at index: Int) {
        dataManager.deleteCosmeticItem(with: cosmeticItems[index].id)
        cosmeticItems.remove(at: index)
    }

    private func сosmeticInfo(from cosmeticRecord: UserCosmeticRecord) -> CosmeticInfo {
        var openDateString: String = ""
        if let openDate = cosmeticRecord.openDate {
            openDateString = DateFormatter.ddMMYY.string(from: openDate)
        }

        var imageSource: ImageSource = .imageData(nil)
        if let url = cosmeticRecord.imageURL {
            imageSource = .url(url)
        } else if let image = cosmeticRecord.imageData {
            imageSource = .imageData(image)
        }

        return CosmeticInfo(
            id: cosmeticRecord.id,
            name: cosmeticRecord.name,
            brand: cosmeticRecord.brand ?? "",
            productionDate: DateFormatter.ddMMYY.string(from: cosmeticRecord.productionDate),
            openDate: openDateString,
            expiryDate: DateFormatter.ddMMYY.string(from: cosmeticRecord.expiryDate),
            image: imageSource
        )
    }
}
