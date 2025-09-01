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
        beautyService.scanProduct(barcode: barcode) { (result: Result<BeautyProduct, Error>) in
            switch result {
            case .success(let product):
                DispatchQueue.main.async {
                    self.view?.navigateToProductDetails(for: product)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print("Error: \(error)")
                    self.view?.showAlert()
                }
            }
        }
    }

}
