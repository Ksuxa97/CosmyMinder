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

    init(with dataManager: DataManagerProtocol) {
        self.dataManager = dataManager
    }

    func addNewProduct(name: String, brand: String, productionDate: String, openDate: String, expiryDate: String, image: CachingImageView?) {

        let id = UUID()
        guard let productionDate = ProductTextField.dateFormatter.date(from: productionDate) else {
            print("Invalid production date")
            return
        }
        let openDate = ProductTextField.dateFormatter.date(from: openDate) ?? nil
        guard let expiryDate = ProductTextField.dateFormatter.date(from: expiryDate) else {
            print("Invalid expiry date")
            return
        }

        image?.saveLocalImage(fileName: "image_\(id)") { url in
            let imageLocalPath = url ?? nil

            let cosmeticItem = CosmeticItem(
                id: id,
                name: name,
                brand: brand,
                productionDate: productionDate,
                openDate: openDate,
                expiryDate: expiryDate,
                imageURL: imageLocalPath
            )
            self.dataManager.addCosmeticItem(cosmeticItem)
            self.delegate?.newProductDidAdded()
        }
    }

    func validateInput(name: String?, productionDate: String?, expiryDate: String?) {
        if let name, !name.isEmpty,
           let productionDate, !productionDate.isEmpty,
           let expiryDate, !expiryDate.isEmpty {
            view?.updateSaveButtonState(isEnabled: true)
        }
        else {
            view?.updateSaveButtonState(isEnabled: false)
        }
    }
}
