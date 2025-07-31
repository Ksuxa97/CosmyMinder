//
//  CosmeticListPresenter.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 23.07.2025.
//

final class CosmeticListPresenter: CosmeticListPresenterProtocol {
    private var cosmeticItems = fakeCosmeticItems
    weak var view: CosmeticListViewProtocol?
    var numberOfItems: Int {
        return cosmeticItems.count
    }

    func getCosmeticItem(at index: Int) -> CosmeticItem {
        guard index >= 0 && index < cosmeticItems.count else {
            fatalError("Ivalid index")
        }
        return cosmeticItems[index]
    }

    func didSelectCosmeticItem(at index: Int) -> Void {
        view?.navigateToEditCosmeticItemScreen(for: cosmeticItems[index])
    }
}
