//
//  AddNewProductManuallyViewController.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 30.07.2025.
//

import UIKit

final class AddNewProductManuallyViewController: UIViewController, AddNewProductManuallyViewProtocol {

    private let presenter: AddNewProductManuallyPresenterProtocol
    private weak var activeTextField: UITextField?

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
    private let productNameInput = FieldStackView(
        title: "Название: *",
        placeholder: "Введите название продукта",
        dataType: .text
    )
    private let productBrandInput = FieldStackView(
        title: "Бренд:",
        placeholder: "Введите бренд продукта",
        dataType: .text
    )
    private let productionDateInput = FieldStackView(
        title: "Дата изготовления: *",
        dataType: .date
    )
    private let openDateInput = FieldStackView(
        title: "Дата открытия упаковки:",
        dataType: .date
    )
    private let expiryDateInput = FieldStackView(
        title: "Дата истечения годности: *",
        dataType: .date
    )

    private let saveButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.setTitle("Сохранить", for: .normal)
        button.isEnabled = false
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

        presenter.didLoad()
        setupUI()
        setupTextFieldDelegates()
        setupKeyboardObservers()
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)

        productNameInput.addTargetToTextField(self, action: #selector(textFieldDidChange))
        productBrandInput.addTargetToTextField(self, action: #selector(textFieldDidChange))
        productionDateInput.addTargetToTextField(self, action: #selector(textFieldDidChange))
        openDateInput.addTargetToTextField(self, action: #selector(textFieldDidChange))
        expiryDateInput.addTargetToTextField(self, action: #selector(textFieldDidChange))
    }

    func updateSaveButtonState(isEnabled: Bool) {
        saveButton.isEnabled = isEnabled
    }

    func prefillFields(with info: CosmeticInfo) {
        productImage.setImage(imageSource: info.image)
        productNameInput.setTextFieldValue(info.name)
        productBrandInput.setTextFieldValue(info.brand)
        productionDateInput.setTextFieldValue(info.productionDate)
        openDateInput.setTextFieldValue(info.openDate)
        expiryDateInput.setTextFieldValue(info.expiryDate)
    }

    @objc private func saveButtonPressed() {
        let fieldsData = getFieldsData()
        presenter.addNewProduct(inputData: fieldsData)

        guard let navigationController = navigationController else { return }
        navigationController.popToRootViewController(animated: true)
    }

    @objc private func textFieldDidChange() {
        let fieldsData = getFieldsData()
        presenter.validateInput(inputData: fieldsData)
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

    private func getFieldsData() -> CosmeticInfo {
        let name = productNameInput.getTextFieldValue()
        let brand = productBrandInput.getTextFieldValue()
        let productionDate = productionDateInput.getTextFieldValue()
        let openDate = openDateInput.getTextFieldValue()
        let expiryDate = expiryDateInput.getTextFieldValue()
        let image = productImage.getImage()

        return CosmeticInfo(
            name: name,
            brand: brand,
            productionDate: productionDate,
            openDate: openDate,
            expiryDate: expiryDate,
            image: image)
    }
}

// MARK: keyboard observing
extension AddNewProductManuallyViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let activeTextField = activeTextField else {
            print("⚠️ Keyboard frame or active text field is nil")
            return
        }
        let activeFieldHeight = keyboardFrame.height - activeTextField.frame.maxY
        scrollView.contentInset.bottom = activeFieldHeight
        scrollView.verticalScrollIndicatorInsets.bottom = activeFieldHeight

        if let superview = activeTextField.superview {
            print("""
            Superview info:
            - Address: \(Unmanaged.passUnretained(superview).toOpaque())
            - Class: \(type(of: superview))
            - Frame: \(superview.frame)
            - Bounds: \(superview.bounds)
            """)
        } else {
            print("No superview - this view is not in hierarchy")
        }

        let textFieldRect = activeTextField.convert(activeTextField.bounds, to: scrollView)
        scrollView.scrollRectToVisible(textFieldRect, animated: true)
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets.bottom = .zero
    }

    private func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    private func setupTextFieldDelegates() {
        productNameInput.textField.delegate = self
        productBrandInput.textField.delegate = self
        productionDateInput.textField.delegate = self
        openDateInput.textField.delegate = self
        expiryDateInput.textField.delegate = self
    }
}
