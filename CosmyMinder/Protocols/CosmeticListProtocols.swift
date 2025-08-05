//
//  CosmeticListProtocols.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 28.07.2025.
//

import Foundation
import UIKit

protocol CosmeticListPresenterProtocol {
    var numberOfItems: Int { get }
    func getCosmeticItem(at index: Int) -> CosmeticItem?
    func didSelectCosmeticItem(at index: Int) -> Void
    func loadImageWithCaching(at index: IndexPath)
}

protocol CosmeticListViewProtocol: AnyObject {
    func navigateToEditCosmeticItemScreen(for item: CosmeticItem) -> Void
    func showAlert() -> Void
    func updateCellImage(_ indexPath: IndexPath, _ image: UIImage?) -> Void
}
