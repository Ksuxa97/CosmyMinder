//
//  CosmeticItemTableViewCell.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 23.07.2025.
//

import UIKit

final class CosmeticItemCell: UITableViewCell {

    static let identifier = "CosmeticItemCell"

    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "placeholder.fill")
        return imageView
    }()

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

    private enum Constants {
        static let imageSideLength: CGFloat = 40
        static let topInset: CGFloat = 12
        static let rightInset: CGFloat = 16
        static let leftInset: CGFloat = -16
        static let bottomInset: CGFloat = -12
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with item: CosmeticItem) -> Void {
        productNameLabel.text = item.name
        brandNameLabel.text = item.brand
    }

    func updateImage(_ image: UIImage?) {
        self.productImageView.image = image ?? UIImage(systemName: "placeholder.fill")
    }

    private func setupCellUI() {
        contentView.addSubview(productImageView)
        contentView.addSubview(productNameLabel)
        contentView.addSubview(brandNameLabel)

        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.topInset),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.rightInset),
            productImageView.widthAnchor.constraint(equalToConstant: Constants.imageSideLength),
            productImageView.heightAnchor.constraint(equalToConstant: Constants.imageSideLength)
        ])

        NSLayoutConstraint.activate([
            productNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.topInset),
            productNameLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: Constants.rightInset),
            productNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.leftInset)
        ])

        NSLayoutConstraint.activate([
            brandNameLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: Constants.topInset),
            brandNameLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: Constants.rightInset),
            brandNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.leftInset),
            brandNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.bottomInset)
        ])
    }
}
