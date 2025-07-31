//
//  AddNewCosmeticItemPresenter.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 29.07.2025.
//

import Vision
import NaturalLanguage
import UIKit

final class AddNewCosmeticItemPresenter: AddNewCosmeticItemPresenterProtocol {
    private weak var view: (any AddNewCosmeticItemViewProtocols)?

    func bindView(view: AddNewCosmeticItemViewProtocols) {
        self.view = view
    }
}
