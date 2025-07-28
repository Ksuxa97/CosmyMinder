//
//  CosmeticListTableViewController.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 23.07.2025.
//

import UIKit

final class CosmeticListViewController: UITableViewController, CosmeticListViewProtocol {

    private var presenter: CosmeticListPresenterProtocol

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(presenter: CosmeticListPresenterProtocol = CosmeticListPresenter()) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        title = "Моя косметика"
        view.backgroundColor = .systemBackground

        setupNavigationBar()
        showCosmeticList(with: fakeCosmeticItems)
    }

    @objc private func addButtonTapped() {
        print("Добавить косметику")
    }

    private func showCosmeticList(with items: [CosmeticItem]) {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)

        tableView.register(CosmeticItemCell.self, forCellReuseIdentifier: CosmeticItemCell.identifier)
    }

    private func setupNavigationBar() {
        // Кнопка добавления в навбаре
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addButtonTapped)
        )
    }

    func navigateToEditCosmeticItemScreen(for item: CosmeticItem) -> Void {
        let cosmeticItemVC = EditCosmeticItemViewController()
        navigationController?.pushViewController(cosmeticItemVC, animated: true)
    }
}

// MARK: TableView operations
extension CosmeticListViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfItems()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> CosmeticItemCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier:CosmeticItemCell.identifier, for: indexPath) as? CosmeticItemCell else {
            fatalError("Ячейка CosmeticItemCell не зарегистрирована")
        }

        cell.configure(with: presenter.getCosmeticItem(at: indexPath.row))
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectCosmeticItem(at: indexPath.row)
    }

}
