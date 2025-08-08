//
//  ProductImageView.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 01.08.2025.
//

import UIKit

final class ProductImageView: UIView, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "camera.fill")
        imageView.tintColor = .gray
        imageView.frame = self.bounds
        imageView.layer.cornerRadius = self.layer.cornerRadius
        return imageView
    }()

    private weak var parentVC: UIViewController?

    init(at view: UIViewController) {
        self.parentVC = view
        super.init(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        self.backgroundColor = .systemBackground
        self.layer.cornerRadius = 12
        self.layer.borderColor = UIColor.systemGray.cgColor
        self.layer.borderWidth = 1
        self.backgroundColor = UIColor.systemGray6
        self.imageView.frame = self.bounds
        self.addSubview(imageView)

        imageView.translatesAutoresizingMaskIntoConstraints = false

        // 2. Констрейнты для imageView
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleImageTap))
        imageView.addGestureRecognizer(tapGesture)
    }

    @objc private func handleImageTap() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        parentVC?.present(picker, animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        imageView.image = selectedImage
        picker.dismiss(animated: true)
    }
}
