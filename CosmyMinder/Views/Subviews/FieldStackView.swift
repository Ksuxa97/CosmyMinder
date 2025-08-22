//
//  FieldStackView.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 15.08.2025.
//

import UIKit

class FieldStackView: UIView {

    private let fieldStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()

    private let inputLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()

    let textField: ProductTextField

    init (title: String, placeholder: String = "", dataType: InputMode) {
        self.inputLabel.text = title
        self.textField = ProductTextField(mode: dataType, placeholder: placeholder)
        super.init(frame: .zero)
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addTargetToTextField(_ target: Any?, action: Selector) {
        textField.addTarget(target, action: action, for: .editingChanged)
    }

    func getTextFieldValue() -> String {
        return textField.text ?? ""
    }

    private func setupUI() {
        self.addSubview(fieldStack)
        fieldStack.addArrangedSubview(inputLabel)
        fieldStack.addArrangedSubview(textField)

        fieldStack.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inputLabel.heightAnchor.constraint(equalToConstant: 22),
            textField.heightAnchor.constraint(equalToConstant: 44),
            fieldStack.widthAnchor.constraint(equalTo: self.widthAnchor),
            fieldStack.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
}
