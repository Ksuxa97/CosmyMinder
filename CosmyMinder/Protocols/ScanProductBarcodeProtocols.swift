//
//  ScanProductBarcodeProtocols.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 29.08.2025.
//

protocol ScanProductBarcodePresenterProtocol {
    func searchProductByBarcode(_ barcode: String)
}

protocol ScanProductBarcodeViewControllerProtocol: AnyObject {
    func showAlert()
    func navigateToProductDetails(for product: BeautyProduct?)
}
