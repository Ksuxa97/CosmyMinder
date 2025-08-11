//
//  CachingInageLoader.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 08.08.2025.
//

import Foundation
import UIKit

class CachingImageLoader: ImageLoaderProtocol {

    func getImage(with imageURL: URL, completion: @escaping(UIImage?) -> Void) {
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            guard let data = data, let image = UIImage(data: data), error == nil else {
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                completion(image)
            }
        }.resume()
    }
}

