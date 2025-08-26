//
//  AddNewProductByQueryPresenter.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 22.08.2025.
//
import Foundation

class AddNewProductByQueryPresenter: AddNewProductByQueryPresenterProtocol {

    var numberOfItems: Int {
        cosmeticItems.count
    }

    weak var view: AddNewProductByQueryViewProtocol?
    private let beautyService: BeautyFactsServiceProtocol
    private var cosmeticItems: [CosmeticItem] = []


    init(service: BeautyFactsServiceProtocol) {
        self.beautyService = service
    }

    func searchProduct(by query: String) {
        beautyService.searchProducts(query: query) { (result: Result<[BeautyProduct], Error>) in
            switch result {
            case .success(let products):
                self.cosmeticItems.removeAll()
                self.cosmeticItems = self.convertResponseToCosmeticItemList(products: products)
                DispatchQueue.main.async {
                    self.view?.updateList()
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

    private func convertResponseToCosmeticItemList(products: [BeautyProduct]) -> [CosmeticItem] {
        for product in products {
            var expiryDate: Date? = nil
            var url: URL? = nil
            if let date = product.expiryDate {
                expiryDate = DateFormatter.ddMMYY.date(from: date)
            }
            if let urlString = product.imageURL {
                url = URL(string: urlString)
            }
            let cosmeticItem = CosmeticItem (
                id: nil,
                name: product.productName,
                brand: product.brand,
                productionDate: nil,
                openDate: nil,
                expiryDate: expiryDate,
                imageURL: url,
                imageData: nil
            )
            cosmeticItems.append(cosmeticItem)
        }
        return cosmeticItems
    }
}
