//
//  AddNewProductManuallyViewController.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 30.07.2025.
//

import UIKit

final class AddNewProductManuallyViewController: UIViewController, AddNewProductManuallyViewProtocol {

    private let presenter: AddNewProductManuallyPresenterProtocol

    private let productStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var productImage = ImagePickerView(at: self)
    private let productNameInput = FieldStackView(with: "Название: *", placeholder: "Введите название продукта", dataType: .text, isRequired: true)
    private let productBrandInput = FieldStackView(with: "Бренд:", placeholder: "Введите бренд продукта", dataType: .text)
    private let productionDateInput = FieldStackView(with: "Дата изготовления: *", dataType: .date, isRequired: true)
    private let openDateInput = FieldStackView(with: "Дата открытия упаковки:", dataType: .date)
    private let expiryDateInput = FieldStackView(with: "Дата истечения годности: *", dataType: .date, isRequired: true)

    private let saveButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.setTitle("Сохранить", for: .normal)
        button.isEnabled = false
        button.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init(presenter: AddNewProductManuallyPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()

        productNameInput.addTargetToTextField(self, action: #selector(textFieldDidChange))
        productionDateInput.addTargetToTextField(self, action: #selector(textFieldDidChange))
        expiryDateInput.addTargetToTextField(self, action: #selector(textFieldDidChange))
    }

    @objc func saveButtonPressed() {
        let name = productNameInput.getTextFieldValue()
        let brand = productBrandInput.getTextFieldValue()
        guard let productionDate = ProductTextField.dateFormatter.date(from: productionDateInput.getTextFieldValue()) else {
            print("Invalid date format")
            return
        }
        guard let openDate = ProductTextField.dateFormatter.date(from: openDateInput.getTextFieldValue()) else {
            print("Invalid date format")
            return
        }
        guard let expiryDate = ProductTextField.dateFormatter.date(from: expiryDateInput.getTextFieldValue()) else {
            print("Invalid date format")
            return
        }

        presenter.addNewProduct(name: name, brand: brand, productionDate: productionDate, openDate: openDate, expiryDate: expiryDate, imageURL: nil)
    }

    @objc func textFieldDidChange() {
        let name = productNameInput.getTextFieldValue()
        let productionDate = productionDateInput.getTextFieldValue()
        let expiryDate = productionDateInput.getTextFieldValue()

        presenter.validateInput(name: name, productionDate: productionDate, expiryDate: expiryDate)
    }

    func enableSaveButton() {
        saveButton.isEnabled = true
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        view.addSubview(saveButton)
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            saveButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            saveButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 2/3),
            saveButton.heightAnchor.constraint(equalToConstant: 44),
        ])

        scrollView.addSubview(productStackView)
        productStackView.addArrangedSubview(productImage)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -8),

            productStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            productStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            productStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            productStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            productStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        ])

        productImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productImage.heightAnchor.constraint(equalTo: productStackView.widthAnchor, multiplier: 2/3)
        ])

        productStackView.addArrangedSubview(productNameInput)
        productStackView.addArrangedSubview(productBrandInput)
        productStackView.addArrangedSubview(productionDateInput)
        productStackView.addArrangedSubview(openDateInput)
        productStackView.addArrangedSubview(expiryDateInput)
    }
}
