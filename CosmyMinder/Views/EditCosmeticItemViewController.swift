//
//  EditCosmeticItemViewController.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 28.07.2025.
//

import UIKit

final class EditCosmeticItemViewController: UIViewController, EditCosmeticItemViewProtocol {

    private let cosmeticItem: CosmeticItem
    private var presenter: EditCosmeticItemPresenterProtocol

    init(cosmeticItem: CosmeticItem, presenter: EditCosmeticItemPresenterProtocol = EditCosmeticItemPresenter()) {
        self.cosmeticItem = cosmeticItem
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = cosmeticItem.name
        view.backgroundColor = .systemBackground
    }

}
