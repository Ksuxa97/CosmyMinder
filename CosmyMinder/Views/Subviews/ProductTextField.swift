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

    convenience init(mode: InputMode, placeholder: String? = nil) {
        self.init(frame: .zero)
        switch mode {
        case .text:
            self.placeholder = placeholder
        case .date:
            self.placeholder = "DD.MM.YY"
            setupDatePicker()
            break
        }

        setupStyle()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
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
        inputView = datePicker
    }

}
