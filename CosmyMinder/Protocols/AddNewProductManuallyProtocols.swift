//
//  AddNewCosmeticItemProtocols.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 29.07.2025.
//

import Foundation

protocol AddNewProductManuallyPresenterProtocol {
    func saveProduct(inputData: CosmeticInfo)
    func validateInput(inputData: CosmeticInfo)
    func didLoad()
}

protocol AddNewProductManuallyViewProtocol: AnyObject {
    func updateSaveButtonState(isEnabled: Bool)
    func prefillFields(with info: CosmeticInfo)
}

protocol ProductAddedDelegate: AnyObject {
    func newProductDidAdded()
}
