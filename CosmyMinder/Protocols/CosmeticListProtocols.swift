//
//  CosmeticListProtocols.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 28.07.2025.
//

protocol CosmeticListPresenterProtocol {
    var numberOfItems: Int { get }
    func bindView(view: CosmeticListViewProtocol)
    func getCosmeticItem(at index: Int) -> CosmeticItem?
    func didSelectCosmeticItem(at index: Int) -> Void
}

protocol CosmeticListViewProtocol: AnyObject {
    func navigateToEditCosmeticItemScreen(for item: CosmeticItem) -> Void
    func showAlert() -> Void
}
