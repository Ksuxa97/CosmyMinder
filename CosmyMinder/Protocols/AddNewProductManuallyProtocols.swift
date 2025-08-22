//
//  AddNewCosmeticItemProtocols.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 29.07.2025.
//

import Foundation
import UIKit

protocol AddNewProductManuallyPresenterProtocol {
    func addNewProduct(name: String, brand: String, productionDate: String, openDate: String, expiryDate: String, image: UIImage?)
    func validateInput(name: String?, productionDate: String?, expiryDate: String?) -> Void
}

protocol AddNewProductManuallyViewProtocol: AnyObject {
    func updateSaveButtonState(isEnabled: Bool)
}

protocol ProductAddedDelegate: AnyObject {
    func newProductDidAdded()
}
