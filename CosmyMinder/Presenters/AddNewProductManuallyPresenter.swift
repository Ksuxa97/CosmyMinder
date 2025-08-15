//
//  AddNewProductManuallyPresenter.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 14.08.2025.
//

import Foundation

class AddNewProductManuallyPresenter: AddNewProductManuallyPresenterProtocol {

    weak var view: AddNewProductManuallyViewProtocol?

    private let dataManager: DataManagerProtocol
    private let fieldsValidator: CosmeticItemValidator

    init(with dataManager: DataManagerProtocol, and fieldsValidator: CosmeticItemValidator) {
        self.dataManager = dataManager
        self.fieldsValidator = fieldsValidator
    }

    func addNewProduct(name: String, brand: String = "", productionDate: Date, openDate: Date? = nil, expiryDate: Date, imageURL: URL? = nil) {
        let cosmeticItem = CosmeticItem(
            name: name,
            brand: brand,
            productionDate: productionDate,
            openDate: openDate,
            expiryDate: expiryDate,
            imageURL: imageURL
        )
        dataManager.addCosmeticItem(cosmeticItem)
    }

    func validateInput(name: String?, productionDate: String?, expiryDate: String?) {
        let isRequiredFilled = CosmeticItemValidator.validate(name: name, productionDate: productionDate, expiryDate: expiryDate)

        if isRequiredFilled {
            view?.enableSaveButton()
        }
    }
}
