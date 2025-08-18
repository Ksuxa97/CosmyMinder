//
//  AddNewCosmeticItemProtocols.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 29.07.2025.
//

import Foundation
import UIKit

protocol AddNewCosmeticItemPresenterProtocol {
    
}

protocol AddNewCosmeticItemViewProtocol: AnyObject {

}

protocol AddNewProductManuallyPresenterProtocol {
    func addNewProduct(name: String, brand: String, productionDate: String, openDate: String, expiryDate: String, image: CachingImage?)
    func validateInput(name: String?, productionDate: String?, expiryDate: String?) -> Void
}

protocol AddNewProductManuallyViewProtocol: AnyObject {
    func enableSaveButton()
}

protocol ProductAddedDelegate: AnyObject {
    func newProductDidAdded()
}
