//
//  AddNewProductByQueryProtocols.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 22.08.2025.
//

import UIKit

protocol AddNewProductByQueryPresenterProtocol {
    var numberOfItems: Int { get }
    func searchProduct(by query: String)
    func getCosmeticItem(at index: Int) -> BeautyProduct?
    func didSelectCosmeticItem(at index: Int, and image: UIImage?)
}

protocol AddNewProductByQueryViewProtocol: AnyObject {
    func updateSearchResults()
    func showAlert()
    func navigateToProductDetails(for product: BeautyProduct)
}
