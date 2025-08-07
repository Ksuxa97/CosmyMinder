//
//  ProductTextField.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 06.08.2025.
//

import UIKit

enum InputMode {
    case text
    case date
}

class ProductTextField: UITextField {

    private let datePicker = UIDatePicker()
    private lazy var toolBar = {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        return toolBar
    }()

    convenience init(mode: InputMode, placeholder: String? = nil) {
        self.init(frame: .zero)
        keyboardType = .numberPad

        switch mode {
        case .text:
            self.placeholder = placeholder
        case .date:
            self.placeholder = "DD.MM.YY"
            setupDatePicker()
            setupInputAccessory()
            addTarget(self, action: #selector(dateFieldDidChange), for: .editingChanged)
            break
        }

        setupStyle()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupStyle() {
        borderStyle = .roundedRect
    }

    private func setupDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        inputView = datePicker
    }

    private func setupInputAccessory() {
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        toolBar.setItems([flexibleSpace, doneButton], animated: true)
        toolBar.setNeedsLayout()
        toolBar.layoutIfNeeded()
        inputAccessoryView = toolBar
    }

    @objc private func dateChanged() {
        updateTextFromPicker()
    }

    @objc private func doneTapped() {
        updateTextFromPicker()
        resignFirstResponder()
    }

    @objc func dateFieldDidChange() {
        formatDateTextInput()
    }

    private func updateTextFromPicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        text = formatter.string(from: datePicker.date)
    }

    private func formatDateTextInput() {
        guard var text = self.text else { return }
        text = text.filter{ $0.isNumber }
        if text.count > 6 {
            text = String(text.prefix(6))
        }

        var formattedText = ""
        for (index, character) in text.enumerated() {
            if index == 2 || index == 4 {
                formattedText.append(".")
            }
            formattedText.append(character)
        }
        self.text = formattedText
    }
}
