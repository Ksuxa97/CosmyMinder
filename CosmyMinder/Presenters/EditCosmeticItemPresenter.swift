//
//  EditCosmeticItemPresenter.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 28.07.2025.
//

final class EditCosmeticItemPresenter: EditCosmeticItemPresenterProtocol {
    private var cosmeticItem: CosmeticItem
    weak var view: EditCosmeticItemViewProtocol?

    var productName: String {
        return cosmeticItem.name
    }

    init(cosmeticItem: CosmeticItem) {
        self.cosmeticItem = cosmeticItem
    }
}
