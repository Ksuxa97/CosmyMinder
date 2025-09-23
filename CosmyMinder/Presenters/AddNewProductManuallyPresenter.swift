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
    private let prefilledData: CosmeticInfo?

    init(dataManager: DataManagerProtocol, info: CosmeticInfo? = nil) {
        self.dataManager = dataManager
        self.prefilledData = info
    }

    func saveProduct(inputData: CosmeticInfo) {

        let id = prefilledData?.id ?? UUID()
        guard let productionDate = DateFormatter.ddMMYY.date(from: inputData.productionDate) else {
            print("Invalid production date")
            return
        }
        let openDate = DateFormatter.ddMMYY.date(from: inputData.openDate)
        guard let expiryDate = DateFormatter.ddMMYY.date(from: inputData.expiryDate) else {
            print("Invalid expiry date")
            return
        }
        var imageURL: URL? = nil
        var imageData: Data? = nil
        switch inputData.image {
            case .url(let url):
                imageURL = url
            case .imageData(let image):
                imageData = image
        }

        let cosmeticItem = UserCosmeticRecord(
            id: id,
            name: inputData.name,
            brand: inputData.brand,
            productionDate: productionDate,
            openDate: openDate,
            expiryDate: expiryDate,
            imageURL: imageURL,
            imageData: imageData
        )

        if prefilledData?.id != nil {
            self.dataManager.editCosmeticItem(cosmeticItem)
        } else {
            self.dataManager.addCosmeticItem(cosmeticItem)
        }

        self.delegate?.newProductDidAdded()
    }

    func validateInput(inputData: CosmeticInfo) {
        let isInputDataChanged =
            prefilledData?.name != inputData.name ||
            prefilledData?.brand != inputData.brand ||
            prefilledData?.productionDate != inputData.productionDate ||
            prefilledData?.openDate != inputData.openDate ||
            prefilledData?.expiryDate != inputData.expiryDate

        let isValid = [inputData.name, inputData.productionDate, inputData.expiryDate]
            .map { $0?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "" }
            .allSatisfy { !$0.isEmpty }
        view?.updateSaveButtonState(isEnabled: isValid && isInputDataChanged)
    }

    func didLoad() {
        guard let data = prefilledData else { return }
        view?.prefillFields(with: data)
    }
}
