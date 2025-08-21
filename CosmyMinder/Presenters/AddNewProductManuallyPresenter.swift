//
//  AddNewProductManuallyPresenter.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 14.08.2025.
//

import Foundation
import UIKit

final class AddNewProductManuallyPresenter: AddNewProductManuallyPresenterProtocol {

    weak var view: AddNewProductManuallyViewProtocol?
    weak var delegate: ProductAddedDelegate?

    private let dataManager: DataManagerProtocol

    init(dataManager: DataManagerProtocol) {
        self.dataManager = dataManager
    }

    func addNewProduct(name: String, brand: String, productionDate: String, openDate: String, expiryDate: String, image: UIImage?) {

        let id = UUID()
        guard let productionDate = DateFormatterManager.shared.ddMMyyFormatter.date(from: productionDate) else {
            print("Invalid production date")
            return
        }
        let openDate = DateFormatterManager.shared.ddMMyyFormatter.date(from: openDate) ?? nil
        guard let expiryDate = DateFormatterManager.shared.ddMMyyFormatter.date(from: expiryDate) else {
            print("Invalid expiry date")
            return
        }
        let localImageData = image?.jpegData(compressionQuality: 0.5)

        let cosmeticItem = CosmeticItem(
            id: id,
            name: name,
            brand: brand,
            productionDate: productionDate,
            openDate: openDate,
            expiryDate: expiryDate,
            imageURL: nil,
            imageData: localImageData
        )
        self.dataManager.addCosmeticItem(cosmeticItem)
        self.delegate?.newProductDidAdded()
    }

    func validateInput(name: String?, productionDate: String?, expiryDate: String?) {
        let trimmedName = name?.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedProductionDate = productionDate?.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedExpiryDate = expiryDate?.trimmingCharacters(in: .whitespacesAndNewlines)
        let isValid = [trimmedName, trimmedProductionDate, trimmedExpiryDate]
            .allSatisfy { str in
            guard let str = str else { return false }
            return !str.isEmpty
        }
        view?.updateSaveButtonState(isEnabled: isValid)
    }
}
