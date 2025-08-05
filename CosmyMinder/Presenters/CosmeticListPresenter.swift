//
//  CosmeticListPresenter.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 23.07.2025.
//

import Foundation
import UIKit

final class CosmeticListPresenter: CosmeticListPresenterProtocol {
    private var cosmeticItems = fakeCosmeticItems
    weak var view: CosmeticListViewProtocol?

    var numberOfItems: Int {
        cosmeticItems.count
    }

    func getCosmeticItem(at index: Int) -> CosmeticItem? {
        guard index >= 0 && index < cosmeticItems.count else {
            return nil
        }
        return cosmeticItems[index]
    }

    func loadImageWithCaching(at index: IndexPath) {
        guard index.row >= 0 && index.row < cosmeticItems.count else { return }

        guard let imageURL = cosmeticItems[index.row].imageURL else { return }

        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            guard let data = data, let image = UIImage(data: data), error == nil else { return }

            DispatchQueue.main.async {
                self.view?.updateCellImage(index, image)
            }
        }.resume()
    }

    func didSelectCosmeticItem(at index: Int) -> Void {
        guard index >= 0 && index < cosmeticItems.count else {
            view?.showAlert()
            return
        }
        view?.navigateToEditCosmeticItemScreen(for: cosmeticItems[index])
    }
}
