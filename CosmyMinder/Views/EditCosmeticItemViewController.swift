//
//  EditCosmeticItemViewController.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 28.07.2025.
//

import UIKit

final class EditCosmeticItemViewController: UIViewController, EditCosmeticItemViewProtocol {

    private let presenter: EditCosmeticItemPresenterProtocol

    init(presenter: EditCosmeticItemPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.bindView(view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = presenter.productName
        view.backgroundColor = .systemBackground
    }
}
