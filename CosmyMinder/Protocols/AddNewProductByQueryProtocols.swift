//
//  AddNewProductByQueryProtocols.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 22.08.2025.
//

protocol AddNewProductByQueryPresenterProtocol {
    var numberOfItems: Int { get }
    func searchProduct(by query: String)
    func getCosmeticItem(at index: Int) -> CosmeticItem?
}

protocol AddNewProductByQueryViewProtocol: AnyObject {
    func updateList()
}
