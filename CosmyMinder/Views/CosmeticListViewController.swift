//
//  CosmeticListTableViewController.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 23.07.2025.
//

import UIKit

final class CosmeticListViewController: UIViewController, CosmeticListViewProtocol {

    private let presenter: CosmeticListPresenterProtocol
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.estimatedRowHeight = 80
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(presenter: CosmeticListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: building List
    private func setupUI() {
        title = "Моя косметика"
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self

        setupNavigationBar()
        showCosmeticList(with: fakeCosmeticItems)
    }

    private func showCosmeticList(with items: [CosmeticItem]) {

        tableView.register(CosmeticItemCell.self, forCellReuseIdentifier: CosmeticItemCell.identifier)

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func setupNavigationBar() {
        // Кнопка добавления в навбаре
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addButtonTapped)
        )
    }
}

// MARK: Navigation to other views
extension CosmeticListViewController {
    
    func navigateToEditCosmeticItemScreen(for item: CosmeticItem) -> Void {
        let editCosmeticItemPresenter = EditCosmeticItemPresenter(cosmeticItem: item)
        let editCosmeticItemVC = EditCosmeticItemViewController(presenter: editCosmeticItemPresenter)
        editCosmeticItemPresenter.view = editCosmeticItemVC
        navigationController?.pushViewController(editCosmeticItemVC, animated: true)
    }

    func showAlert() -> Void {
        let alert = UIAlertController(
            title: "Ошибка",
            message: "Не вышло загрузить данные",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))

        present(alert, animated: true)
    }

    @objc private func addButtonTapped() {
        let actionSheet = UIAlertController(title: "Добавить новый продукт", message: nil, preferredStyle: .actionSheet)

        actionSheet.addAction(UIAlertAction(title: "По фото", style: .default))
        actionSheet.addAction(UIAlertAction(title: "Отсканировать штрихкод", style: .default))
        actionSheet.addAction(UIAlertAction(title: "Поиск по базе", style: .default))
        actionSheet.addAction(UIAlertAction(title: "Вручную", style: .default, handler: showAddNewProductManuallyView))
        actionSheet.addAction(UIAlertAction(title: "Отмена", style: .cancel))

        present(actionSheet, animated: true)
    }

    private func showAddNewProductManuallyView(_ action: UIAlertAction) -> Void {
        let addNewProductManuallyVC = AddNewProductManuallyViewController()
        navigationController?.pushViewController(addNewProductManuallyVC, animated: true)
    }
}

// MARK: TableView operations

extension CosmeticListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectCosmeticItem(at: indexPath.row)
    }
}

extension CosmeticListViewController: UITableViewDataSource {

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

        cell.configure(with: item)
        return cell
    }
}
