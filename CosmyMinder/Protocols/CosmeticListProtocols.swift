//
//  CosmeticListProtocols.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 28.07.2025.
//

protocol CosmeticListPresenterProtocol {
    var view: CosmeticListViewProtocol? { get set }
    func numberOfItems() -> Int
    func getCosmeticItem(at index: Int) -> CosmeticItem
    func didSelectCosmeticItem(at index: Int) -> Void
}

protocol CosmeticListViewProtocol: AnyObject {
    func navigateToEditCosmeticItemScreen(for item: CosmeticItem) -> Void
}
