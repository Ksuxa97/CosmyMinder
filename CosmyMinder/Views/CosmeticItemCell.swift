//
//  CosmeticItemTableViewCell.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 23.07.2025.
//

import UIKit

final class CosmeticItemCell: UITableViewCell {

    static let identifier = "CosmeticItemCell"

    private var currentContent: UIListContentConfiguration?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with item: CosmeticItem) -> Void {
        var content = self.defaultContentConfiguration()
        content.text = item.name
        content.secondaryText = item.brand
        content.image = UIImage(systemName: "placeholder.fill")
        content.imageProperties.maximumSize = CGSize(width: 40, height: 40)

        currentContent = content
        self.contentConfiguration = content
    }

    func updateImage(_ image: UIImage?) {
        self.currentContent?.image = image ?? UIImage(systemName: "placeholder.fill")
        self.contentConfiguration = self.currentContent
    }

}
