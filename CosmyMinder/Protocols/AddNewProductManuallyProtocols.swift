//
//  AddNewCosmeticItemProtocols.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 29.07.2025.
//

import Foundation

protocol AddNewProductManuallyPresenterProtocol {
    func addNewProduct(name: String, brand: String, productionDate: String, openDate: String, expiryDate: String, imageSource: ImageSource)
    func validateInput(name: String?, productionDate: String?, expiryDate: String?)
    func prefillFields()
}

protocol AddNewProductManuallyViewProtocol: AnyObject {
    func updateSaveButtonState(isEnabled: Bool)
    func fillInputs(with data: BeautyProduct)
}

protocol ProductAddedDelegate: AnyObject {
    func newProductDidAdded()
}
