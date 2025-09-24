//
//  ProductImageView.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 01.08.2025.
//

import UIKit

enum ImageSource: Equatable {
    case imageData(Data?)
    case url(URL)

    static func == (lhs: ImageSource, rhs: ImageSource) -> Bool {
        switch (lhs, rhs) {
        case let (.imageData(data1), .imageData(data2)):
            return data1 == data2
        case let (.url(url1), .url(url2)):
            return url1 == url2
        default:
            return false
        }
    }
}

final class ImagePickerView: UIView, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private lazy var imageView: CachingImageView = {
        let imageView = CachingImageView()
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

    func getImage() -> ImageSource {
        if let url = imageView.getImageURL() {
            return .url(url)
        } else {
            return .imageData(imageView.image?.jpegData(compressionQuality: 0.5))
        }
    }

    func setImage(imageSource: ImageSource) {
        switch imageSource {
        case .imageData(let data):
            guard let data = data else { return }
            imageView.image = UIImage(data: data)
        case .url(let url):
            imageView.laodImage(url: url)
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        imageView.image = selectedImage
        imageView.clearImageURL()
        picker.dismiss(animated: true)
    }

    private func setupUI() {
        self.backgroundColor = .systemBackground
        self.layer.cornerRadius = 12
        self.layer.borderColor = UIColor.systemGray.cgColor
        self.layer.borderWidth = 1
        self.backgroundColor = UIColor.systemGray6
        self.addSubview(imageView)

        imageView.translatesAutoresizingMaskIntoConstraints = false

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
}
