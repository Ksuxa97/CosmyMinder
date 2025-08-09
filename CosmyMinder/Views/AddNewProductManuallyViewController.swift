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
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var productImage = ImagePickerView(at: self)
    private let productNameTextField = ProductTextField(mode: .text, placeholder: "Название")
    private let productBrandTextField = ProductTextField(mode: .text, placeholder: "Бренд")
    private let productionDatePicker = ProductTextField(mode: .date)


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground

        productStackView.addArrangedSubview(productImage)
        productStackView.addArrangedSubview(productNameTextField)
        productStackView.addArrangedSubview(productBrandTextField)
        productStackView.addArrangedSubview(productionDatePicker)
        view.addSubview(productStackView)

        NSLayoutConstraint.activate([
            productStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            productStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            productStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])

        productImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productImage.widthAnchor.constraint(equalTo: productStackView.widthAnchor),
            productImage.heightAnchor.constraint(equalTo: productStackView.widthAnchor, multiplier: 2/3),
            productImage.centerXAnchor.constraint(equalTo: productStackView.centerXAnchor)
        ])

        setConsstraintsForProductTextField(for: productNameTextField)
        setConsstraintsForProductTextField(for: productBrandTextField)
        setConsstraintsForProductTextField(for: productionDatePicker)
    }

    private func setConsstraintsForProductTextField(for item: ProductTextField) {
        item.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            item.leadingAnchor.constraint(equalTo: productStackView.leadingAnchor),
            item.trailingAnchor.constraint(equalTo: productStackView.trailingAnchor)
        ])
    }

    @objc private func didTapImage() {
        print("Image tapped!")
        // Действие при нажатии
    }
}
