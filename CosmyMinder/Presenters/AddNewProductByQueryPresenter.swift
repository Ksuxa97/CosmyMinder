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
        cosmeticItems.count
    }

    weak var view: AddNewProductByQueryViewProtocol?
    private let beautyService: BeautyFactsServiceProtocol
    private var cosmeticItems: [CosmeticItem] = []
    private var productList: [BeautyProduct] = []

    init(service: BeautyFactsServiceProtocol) {
        self.beautyService = service
    }

    func searchProduct(by query: String) {
        beautyService.searchProducts(query: query) { (result: Result<[BeautyProduct], Error>) in
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    self.productList = products
                    self.prepareCosmeticItemList()
                    self.view?.updateSearchResults()
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }

    func getCosmeticItem(at index: Int) -> CosmeticItem? {
        guard index >= 0 && index < cosmeticItems.count else {
            return nil
        }
        return cosmeticItems[index]
    }

    func didSelectCosmeticItem(at index: Int, and image: UIImage?) -> Void {
        guard index >= 0 && index < cosmeticItems.count else {
            view?.showAlert()
            return
        }
        view?.navigateToProductDetails(for: productList[index], with: image)
    }

    private func prepareCosmeticItemList() {
        cosmeticItems.removeAll()
        for product in productList {
            let item = beautyService.convertToCosmeticItem(product: product)
            cosmeticItems.append(item)
        }
    }
}
