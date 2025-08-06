//
//  AddNewProductManuallyViewController.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 30.07.2025.
//

import UIKit

final class AddNewProductManuallyViewController: UIViewController {

    private var productStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        return stackView
    }()

    private lazy var productImage = ProductImageView(at: self)

    private var productNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Название продукта"
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground

        productStackView.addArrangedSubview(productImage)
        productStackView.addArrangedSubview(productNameTextField)
        view.addSubview(productStackView)


        productStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            productStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            productStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            productStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])

        productImage.translatesAutoresizingMaskIntoConstraints = false

        // 3. Констрейнты для изображения
        NSLayoutConstraint.activate([
            productImage.widthAnchor.constraint(equalTo: productStackView.widthAnchor),
            productImage.heightAnchor.constraint(equalTo: productStackView.widthAnchor, multiplier: 2/3),
            productImage.centerXAnchor.constraint(equalTo: productStackView.centerXAnchor)
        ])
    }

    @objc private func didTapImage() {
        print("Image tapped!")
        // Действие при нажатии
    }
}
