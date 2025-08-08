//
//  ImageLoaderProtocol.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 08.08.2025.
//

import UIKit

protocol ImageLoaderProtocol {
    func getImage(with imageURL: URL, completion: @escaping(UIImage?) -> Void)
}
