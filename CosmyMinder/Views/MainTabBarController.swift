//
//  MainTabBarController.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 24.07.2025.
//

import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }

    private func setupTabs() {
        let dataManager = DataManager()
        let cosmeticListPresenter = CosmeticListPresenter(with: dataManager)
        let cosmeticListVC = CosmeticListViewController(presenter: cosmeticListPresenter)
        cosmeticListPresenter.view = cosmeticListVC
        let navigationController = UINavigationController(rootViewController: cosmeticListVC)
        navigationController.tabBarItem = UITabBarItem(title: "Косметика", image: UIImage(systemName: "sparkles"), tag: 0)

        let placeholderVC = UIViewController()
        placeholderVC.view.backgroundColor = .systemBackground
        placeholderVC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.crop.circle"), tag: 1)

        viewControllers = [navigationController, placeholderVC]
    }
}
