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

    static let barcodeNotFound: UIAlertController = {
        let alert = UIAlertController(
            title: "Ошибка",
            message: "Не удалось сканировать код",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Отмена", style: .default))
        alert.addAction(UIAlertAction(title: "OK", style: .default))

        return alert
    }()

    func showAlert(_ type: AlertTypes) -> Void {
        let alert: UIAlertController

        switch type {
        case .failure:
            alert = UIAlertController(
                title: "Ошибка",
                message: "Не вышло загрузить данные",
                preferredStyle: .alert
            )
        case .barcodeNotFound(let cancelAction, let addAction):
            alert = UIAlertController(
                title: "Ошибка",
                message: "Продукт не найден. Добавить вручную?",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "Отмена", style: .default, handler: cancelAction))
            alert.addAction(UIAlertAction(title: "Добавить", style: .default, handler: addAction))
        }
        present(alert, animated: true)
    }

}
