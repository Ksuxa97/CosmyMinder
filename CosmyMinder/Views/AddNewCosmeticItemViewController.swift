//
//  AddNewCosmeticItemViewController.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 28.07.2025.
//

import UIKit

final class AddNewCosmeticItemViewController: UIViewController, AddNewCosmeticItemViewProtocols {
    private let presenter: AddNewCosmeticItemPresenterProtocol

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Новый продукт"
    }

    init(presenter: AddNewCosmeticItemPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
