//
//  ScanProductBarcodePresenter.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 29.08.2025.
//
import Foundation

final class ScanProductBarcodePresenter: ScanProductBarcodePresenterProtocol {

    weak var view: ScanProductBarcodeViewControllerProtocol?
    private let beautyService: BeautyFactsServiceProtocol

    init(service: BeautyFactsServiceProtocol) {
        self.beautyService = service
    }

    func searchProductByBarcode(_ barcode: String) {
        beautyService.searchProduct(by: barcode) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let product):
                let info = self.beautyService.cosmeticInfo(from: product)
                self.view?.navigateToProductDetails(with: info)
            case .failure(let error):
                print("Error: \(error)")
                self.view?.showAlert()
            }
        }
    }

}
