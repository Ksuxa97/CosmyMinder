//
//  EditCosmeticItemPresenter.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 28.07.2025.
//

final class EditCosmeticItemPresenter: EditCosmeticItemPresenterProtocol {
    weak var view: EditCosmeticItemViewProtocol?
    var productName: String {
        cosmeticItem.name
    }
    private var cosmeticItem: CosmeticItem

    init(cosmeticItem: CosmeticItem) {
        self.cosmeticItem = cosmeticItem
    }
}
