//
//  AddNewCosmeticItemProtocols.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 29.07.2025.
//

import Foundation

protocol AddNewCosmeticItemPresenterProtocol {
    
}

protocol AddNewCosmeticItemViewProtocol: AnyObject {

}

protocol AddNewProductManuallyPresenterProtocol {
    func addNewProduct(name: String, brand: String, productionDate: Date, openDate: Date?, expiryDate: Date, imageURL: URL?)
    func validateInput(name: String?, productionDate: String?, expiryDate: String?) -> Void
}

protocol AddNewProductManuallyViewProtocol: AnyObject {
    func enableSaveButton()
}
