//
//  AddNewProductByQueryViewController.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 22.08.2025.
//
import Foundation
import UIKit

final class AddNewProductByQueryViewController: UIViewController, AddNewProductByQueryViewProtocol {

    private let presenter: AddNewProductByQueryPresenterProtocol

    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchTextField.backgroundColor = .systemBackground
        searchBar.placeholder = "Найти продукт"
        searchBar.searchBarStyle = .minimal
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()

    private let cosmeticTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.estimatedRowHeight = 80
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    init(presenter: AddNewProductByQueryPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        navigationItem.backButtonDisplayMode = .minimal
        navigationItem.backButtonTitle = ""
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func showAlert() -> Void {
        let alert = UIAlertController.failure("Не вышло загрузить данные")
        present(alert, animated: true)
    }

    func navigateToProductDetails(with info: CosmeticInfo) {
        let dataManager = DataManager()
        let productDetailsPresenter = AddNewProductManuallyPresenter(dataManager: dataManager, info: info)
        let productDetailsVC = AddNewProductManuallyViewController(presenter: productDetailsPresenter)
        productDetailsPresenter.view = productDetailsVC

        navigationController?.pushViewController(productDetailsVC, animated: true)
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        title = "Найти продукт"
        searchBar.delegate = self
        view.addSubview(searchBar)

        cosmeticTableView.delegate = self
        cosmeticTableView.dataSource = self
        cosmeticTableView.register(CosmeticItemCell.self, forCellReuseIdentifier: CosmeticItemCell.identifier)
        view.addSubview(cosmeticTableView)

        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            searchBar.heightAnchor.constraint(equalToConstant: 44),
            cosmeticTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            cosmeticTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            cosmeticTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            cosmeticTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension AddNewProductByQueryViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier:CosmeticItemCell.identifier, for: indexPath) as? CosmeticItemCell else {
            fatalError("Ячейка CosmeticItemCell не зарегистрирована")
        }

        guard let item = presenter.getCosmeticItem(at: indexPath.row) else {
            cell.isHidden = true
            cell.backgroundColor = .clear
            return cell
        }

        let imageURL = URL(string: item.imageURL ?? "") ?? nil

        cell.configure(name: item.name, brand: item.brand, imageURL: imageURL, imageData: nil)
        return cell
    }

    func updateSearchResults() {
        cosmeticTableView.reloadData()
    }
}

extension AddNewProductByQueryViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as? CosmeticItemCell
        let image = cell?.getCellImage()
        presenter.didSelectCosmeticItem(at: indexPath.row, and: image)
    }
}

extension AddNewProductByQueryViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            presenter.searchProduct(by: searchText)
            searchBar.resignFirstResponder()
        }
    }
}
