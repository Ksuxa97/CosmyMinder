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
        let info = userRecordToCosmeticInfo(item: cosmeticItems[index])
        view?.navigateToProductDetails(with: info)
    }

    func deleteUserRecord(at index: Int) {
        dataManager.deleteCosmeticItem(with: cosmeticItems[index].id)
        cosmeticItems.remove(at: index)
    }

    private func userRecordToCosmeticInfo(item: UserCosmeticRecord) -> CosmeticInfo {
        var openDateString: String = ""
        if let openDate = item.openDate {
            openDateString = DateFormatter.ddMMYY.string(from: openDate)
        }

        var imageSource: ImageSource = .imageData(nil)
        if let url = item.imageURL {
            imageSource = .url(url)
        } else if let image = item.imageData {
            imageSource = .imageData(image)
        }

        return CosmeticInfo(
            recordID: item.id,
            name: item.name,
            brand: item.brand ?? "",
            productionDate: DateFormatter.ddMMYY.string(from: item.productionDate),
            openDate: openDateString,
            expiryDate: DateFormatter.ddMMYY.string(from: item.expiryDate),
            image: imageSource
        )
    }
}
