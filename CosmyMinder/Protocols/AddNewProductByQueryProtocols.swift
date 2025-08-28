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
    func getCosmeticItem(at index: Int) -> CosmeticItem?
    func didSelectCosmeticItem(at index: Int, and image: UIImage?) -> Void
}

protocol AddNewProductByQueryViewProtocol: AnyObject {
    func updateSearchResults()
    func showAlert() -> Void
    func navigateToProductDetails(for product: BeautyProduct, with image: UIImage?)
}
