//
//  CosmeticItemTableViewCell.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 23.07.2025.
//

import UIKit

final class CosmeticItemCell: UITableViewCell {

    static let identifier = "CosmeticItemCell"

    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let brandNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellUI()
    }

    private func setupCellUI() {
        contentView.addSubview(productNameLabel)
        contentView.addSubview(brandNameLabel)

        NSLayoutConstraint.activate([
            productNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            productNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            brandNameLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 12),
            brandNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            brandNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with item: CosmeticItem) -> Void {
        var content = self.defaultContentConfiguration()
        content.text = item.name
        content.secondaryText = item.brand
        content.image = UIImage(systemName: "photo")

        self.contentConfiguration = content
    }

}
