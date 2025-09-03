//
//  AddNewProductByQueryPresenter.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 22.08.2025.
//
import Foundation
import UIKit

final class AddNewProductByQueryPresenter: AddNewProductByQueryPresenterProtocol {

    var numberOfItems: Int {
        productList.count
    }

    weak var view: AddNewProductByQueryViewProtocol?
    private let beautyService: BeautyFactsServiceProtocol
    private var cosmeticItems: [UserCosmeticRecord] = []
    private var productList: [BeautyProduct] = []

    init(service: BeautyFactsServiceProtocol) {
        self.beautyService = service
    }

    func searchProduct(by query: String) {
        beautyService.searchProducts(query: query) { result in
            switch result {
            case .success(let products):
                self.productList = products
                self.view?.updateSearchResults()
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }

    func getCosmeticItem(at index: Int) -> BeautyProduct? {
        guard index >= 0 && index < productList.count else {
            return nil
        }
        return productList.getSafe(at: index)
    }

    func didSelectCosmeticItem(at index: Int, and image: UIImage?) -> Void {
        guard index >= 0 && index < productList.count else {
            view?.showAlert()
            return
        }
        let info = beautyService.productToCosmeticInfo(product: productList[index])
        view?.navigateToProductDetails(with: info)
    }
}
