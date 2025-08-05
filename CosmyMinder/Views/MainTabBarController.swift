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
        // Вкладка с косметикой
        let cosmeticListPresenter = CosmeticListPresenter()
        let cosmeticListVC = CosmeticListViewController(presenter:cosmeticListPresenter)
        let navigationController = UINavigationController(rootViewController: cosmeticListVC)
        navigationController.tabBarItem = UITabBarItem(title: "Косметика", image: UIImage(systemName: "sparkles"), tag: 0)

        // Заглушки для будущих экранов
        let placeholderVC = UIViewController()
        placeholderVC.view.backgroundColor = .systemBackground
        placeholderVC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.crop.circle"), tag: 1)

        viewControllers = [navigationController, placeholderVC]
    }
}
