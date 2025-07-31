//
//  CosmeticItemProtocols.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 28.07.2025.
//

protocol EditCosmeticItemPresenterProtocol {
    var productName: String { get }
    func bindView(view: EditCosmeticItemViewProtocol)
}

protocol EditCosmeticItemViewProtocol: AnyObject {

}
