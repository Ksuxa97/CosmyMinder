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
        stackView.spacing = 20
        return stackView
    }()

    private lazy var productImage = ProductImageView(at: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground
        productStackView.addArrangedSubview(productImage)
        view.addSubview(productStackView)

        productStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            productStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            productStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            productStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])

        productImage.translatesAutoresizingMaskIntoConstraints = false

        // 3. Констрейнты для изображения
        NSLayoutConstraint.activate([
            productImage.heightAnchor.constraint(equalToConstant: 100),
            productImage.widthAnchor.constraint(equalTo: productImage.heightAnchor)
        ])
    }

    @objc private func didTapImage() {
        print("Image tapped!")
        // Действие при нажатии
    }
}
