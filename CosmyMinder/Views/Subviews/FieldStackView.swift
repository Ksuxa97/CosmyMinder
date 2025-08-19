//
//  FieldStackView.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 15.08.2025.
//

import UIKit

class FieldStackView: UIStackView {

    private let inputLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()

    let textField: ProductTextField

    init (with title: String, placeholder: String = "", dataType: InputMode, isRequired: Bool = false) {

        self.inputLabel.text = title
        self.textField = ProductTextField(mode: dataType, placeholder: placeholder)
        super.init(frame: .zero)

        self.axis = .vertical
        self.spacing = 8

        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addTargetToTextField(_ target: Any?, action: Selector) {
        textField.addTarget(target, action: action, for: .editingChanged)
    }

    func getTextFieldValue() -> String {
        guard let text = textField.text else { return "" }
        return text
    }

    private func setupUI() {
        self.addArrangedSubview(inputLabel)
        self.addArrangedSubview(textField)

        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inputLabel.heightAnchor.constraint(equalToConstant: 22),
            textField.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
