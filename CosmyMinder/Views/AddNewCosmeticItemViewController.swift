//
//  AddNewCosmeticItemViewController.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 28.07.2025.
//

import UIKit

class AddNewCosmeticItemViewController:
    UIViewController, AddNewCosmeticItemViewProtocols {
    private var presenter: AddNewCosmeticItemPresenterProtocol

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Новый продукт"
    }

    init(presenter: AddNewCosmeticItemPresenterProtocol = AddNewCosmeticItemPresenter()) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = self

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
