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

    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        return formatter
    }()

    private lazy var datePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        datePicker.addTarget(self, action: #selector(dateFieldDidBeginEditing), for: .editingDidBegin)
        return datePicker
    }()
    private lazy var toolBar = {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        return toolBar
    }()

    init(mode: InputMode, placeholder: String? = nil) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false

        switch mode {
        case .text:
            self.placeholder = placeholder
            keyboardType = .default
            returnKeyType = .done

        case .date:
            self.placeholder = "DD.MM.YY"
            keyboardType = .numberPad
            addTarget(self, action: #selector(dateFieldDidChange), for: .editingChanged)
            setupInputAccessory()
        }

        borderStyle = .roundedRect
        autocorrectionType = .no
        smartDashesType = .no
        smartQuotesType = .no
        smartInsertDeleteType = .no
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupInputAccessory() {
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let toggleButton = UIBarButtonItem(
                    title: "Выбрать дату",
                    style: .plain,
                    target: self,
                    action: #selector(toggleDatePicker)
                )
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        toolBar.setItems([toggleButton, flexibleSpace, doneButton], animated: true)
        inputAccessoryView = toolBar
    }

    @objc private func toggleDatePicker() {
        if self.inputView == nil {
            self.inputView = datePicker
            self.toolBar.items?.first?.title = "Ввести текст"
        } else {
            self.inputView = nil
            toolBar.items?.first?.title = "Выбрать дату"
        }
        reloadInputViews()
    }

    @objc private func dateChanged() {
        if self.inputView == nil {
            updatePickerFromText()
        } else {
            updateTextFromPicker()
        }
    }

    @objc private func doneTapped() {
        if self.inputView == nil {
            updatePickerFromText()
        } else {
            updateTextFromPicker()
        }
        resignFirstResponder()
    }

    @objc private func dateFieldDidBeginEditing() {
        if self.inputView == nil {
            updatePickerFromText()
        } else {
            updateTextFromPicker()
        }
    }

    @objc func dateFieldDidChange() {
        formatDateTextInput()
    }

    private func updateTextFromPicker() {
        text = ProductTextField.dateFormatter.string(from: datePicker.date)
    }

    private func updatePickerFromText() {
        guard let text = self.text else { return }
        if let date = ProductTextField.dateFormatter.date(from: text) {
            datePicker.date = date
        }
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
