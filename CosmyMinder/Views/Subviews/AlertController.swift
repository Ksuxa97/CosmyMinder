//
//  AlertController.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 31.08.2025.
//

import UIKit

extension UIAlertController {

    enum AlertTypes {
        case failure
        case barcodeNotFound(cancelAction: (UIAlertAction) -> Void, addAction: (UIAlertAction) -> Void)
    }

    static func failure(_ message: String) -> UIAlertController {
        let alert = UIAlertController(
            title: "Ошибка",
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        return alert
    }


    static func barcodeNotFound(
        cancelAction: @escaping (UIAlertAction) -> Void,
        addAction: @escaping (UIAlertAction) -> Void
    ) -> UIAlertController {
        let alert = UIAlertController(
            title: "Ошибка",
            message: "Не удалось найти продукт. Добавите его вручную?",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Отмена", style: .default, handler: cancelAction))
        alert.addAction(UIAlertAction(title: "Добавить", style: .default, handler: addAction))
        return alert
    }

}
