//
//  CachingInageLoader.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 08.08.2025.
//

import Foundation
import UIKit

final class CachingImageView: UIImageView {

    private static let imageCache = NSCache<NSURL, UIImage>()
    private let fileManagerQueue = DispatchQueue(label: "fileManagerQueue", qos: .userInitiated)
    private var currentURL: URL?

    func laodImage(url: URL) {
        if let image = loadImageFromCache(url: url) {
            self.image = image
        } else {
            loadImageByURL(url)
            cacheImage(url: url)
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

    private func cacheImage(url: URL) {
        guard let image = self.image else {
            print("Не вышло закешировать изображение")
            return
        }
        CachingImageView.imageCache.setObject(image, forKey: url as NSURL)
    }

    private func loadImageFromCache(url: URL) -> UIImage? {
        return CachingImageView.imageCache.object(forKey: url as NSURL)
    }

    private func loadImageByURL(_ url: URL, placeholder: UIImage? = nil) {
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
