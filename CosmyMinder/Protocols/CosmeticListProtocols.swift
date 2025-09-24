//
//  CosmeticListProtocols.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 28.07.2025.
//

protocol CosmeticListPresenterProtocol {
    var numberOfItems: Int { get }
    func updateCosmeticList() -> Void
    func getCosmeticItem(at index: Int) -> UserCosmeticRecord?
    func didSelectCosmeticItem(at index: Int)
    func deleteCosmeticRecord(at index: Int)
}

protocol CosmeticListViewProtocol: AnyObject {
    func navigateToProductDetails(with info: CosmeticInfo?)
    func showAlert()
}
