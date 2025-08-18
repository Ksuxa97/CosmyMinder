//
//  CachingInageLoader.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 08.08.2025.
//

import Foundation
import UIKit

final class CachingImage: UIImageView {

    private static let imageCache = NSCache<NSUUID, UIImage>()
    private let fileManagerQueue = DispatchQueue(label: "fileManagerQueue", qos: .userInitiated)

    private var currentURL: URL?

    func laodImage(_ itemID: UUID, url: URL? = nil) {
        if let image = loadImageFromCache(id: itemID) {
            self.image = image
        }

        if let url = url {
            loadImageByURL(url)
            cacheImage(id: itemID)
        }
        return
    }

    func saveLocalImage(fileName: String, completion: @escaping (URL?) -> Void) {
        let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(fileName, conformingTo: .jpeg)

        guard let imageData = self.image?.jpegData(compressionQuality: 0.7) else {
            print("Ошибка при сохранении изображения")
            completion(nil)
            return
        }

        fileManagerQueue.async {
            do {
                try imageData.write(to: filePath)
                DispatchQueue.main.async {
                    completion(filePath)
                }
            } catch {
                print("Ошибка при сохранении изображения")
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }

    func cacheImage(id: UUID) {
        CachingImage.imageCache.setObject(self.image!, forKey: id as NSUUID)
    }

    func loadImageFromCache(id: UUID) -> UIImage? {
        return CachingImage.imageCache.object(forKey: id as NSUUID)
    }

    func loadImageByURL(_ url: URL, placeholder: UIImage? = nil) {
        currentURL = url
        self.image = UIImage(systemName: "photo")

        DispatchQueue.global().async { [weak self] in

            guard let data = try? Data(contentsOf: url) else {return}
            guard self?.currentURL == url else {
                print("URL changed during download, ignoring result")
                return
            }

            guard let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                guard self?.currentURL == url else {
                    print("URL changed before setting image, ignoring result")
                    return
                }
                self?.image = image
            }
        }
    }
}

