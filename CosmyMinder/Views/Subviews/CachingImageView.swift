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
    private var currentURL: URL?

    func laodImage(url: URL, placeholder: UIImage? = UIImage(systemName: "picture")) {
        if let image = loadImageFromCache(url: url) {
            self.image = image
        } else {
            loadImageByURL(url, placeholder: placeholder)
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

    private func loadImageByURL(_ url: URL, placeholder: UIImage?) {
        currentURL = url
        self.image = placeholder

        DispatchQueue.global().async { [weak self] in
            guard let data = try? Data(contentsOf: url) else {return}
            guard let self else { return }
            guard self.currentURL == url else {
                print("URL changed during download, ignoring result")
                return
            }

            guard let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                guard self.currentURL == url else {
                    print("URL changed before setting image, ignoring result")
                    return
                }
                self.image = image
                self.cacheImage(url: url)
            }
        }
    }
}
