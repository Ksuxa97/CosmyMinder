//
//  FakeCosmeticItems.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 26.07.2025.
//

import Foundation

let fakeCosmeticItems: [CosmeticItem] = [
    CosmeticItem(
        name: "Увлажняющий крем для лица",
        brand: "La Roche-Posay",
        productionDate: Calendar.current.date(byAdding: .month, value: -3, to: Date())!,
        openDate: Calendar.current.date(byAdding: .day, value: -30, to: Date())!,
        expiryDate: Calendar.current.date(byAdding: .month, value: 9, to: Date())!,
        imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr--EKOdoZkWCHWtWAs-2C6kjZ0iaNP2VNXw&s")
    ),

    CosmeticItem(
        name: "Тонирующий BB-крем",
        brand: "Missha",
        productionDate: Calendar.current.date(byAdding: .month, value: -6, to: Date())!,
        openDate: nil, // Не открыт
        expiryDate: Calendar.current.date(byAdding: .month, value: 6, to: Date())!,
        imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr--EKOdoZkWCHWtWAs-2C6kjZ0iaNP2VNXw&s")
    ),

    CosmeticItem(
        name: "Гиалуроновая сыворотка",
        brand: "The Ordinary",
        productionDate: Calendar.current.date(byAdding: .year, value: -1, to: Date())!,
        openDate: Calendar.current.date(byAdding: .month, value: -8, to: Date())!,
        expiryDate: Calendar.current.date(byAdding: .month, value: -2, to: Date())!, // Просрочена
        imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr--EKOdoZkWCHWtWAs-2C6kjZ0iaNP2VNXw&s")
    ),

    CosmeticItem(
        name: "Матовая помада",
        brand: "MAC",
        productionDate: Calendar.current.date(byAdding: .month, value: -4, to: Date())!,
        openDate: Calendar.current.date(byAdding: .day, value: -15, to: Date())!,
        expiryDate: Calendar.current.date(byAdding: .year, value: 1, to: Date())!,
        imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr--EKOdoZkWCHWtWAs-2C6kjZ0iaNP2VNXw&s")
    ),

    CosmeticItem(
        name: "Очищающий гель",
        brand: "CeraVe",
        productionDate: Calendar.current.date(byAdding: .month, value: -2, to: Date())!,
        openDate: nil,
        expiryDate: Calendar.current.date(byAdding: .month, value: 10, to: Date())!,
        imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr--EKOdoZkWCHWtWAs-2C6kjZ0iaNP2VNXw&s")
    )
]

