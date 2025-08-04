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

    func getCosmeticItem(at index: Int) -> CosmeticItem? {
        guard index >= 0 && index < cosmeticItems.count else {
            return nil
        }
        return cosmeticItems[index]
    }

    func didSelectCosmeticItem(at index: Int) -> Void {
        guard index >= 0 && index < cosmeticItems.count else {
            view?.showAlert()
            return
        }
        view?.navigateToEditCosmeticItemScreen(for: cosmeticItems[index])
    }
}
