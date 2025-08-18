//
//  FakeCosmeticItems.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 26.07.2025.
//

import Foundation

//let fakeCosmeticItems: [CosmeticItem] = [
//    CosmeticItem(
//        name: "Увлажняющий крем для лица",
//        brand: "La Roche-Posay",
//        productionDate: Calendar.current.date(byAdding: .month, value: -3, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .day, value: -30, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .month, value: 9, to: Date())!,
//        imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr--EKOdoZkWCHWtWAs-2C6kjZ0iaNP2VNXw&s")
//    ),
//
//    CosmeticItem(
//        name: "Тонирующий BB-крем",
//        brand: "Missha",
//        productionDate: Calendar.current.date(byAdding: .month, value: -6, to: Date())!,
//        openDate: nil, // Не открыт
//        expiryDate: Calendar.current.date(byAdding: .month, value: 6, to: Date())!,
//        imageURL: URL(string: "https://images.unsplash.com/photo-1656147961590-c454747afb06?w=126&dpr=2&h=147&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXRodW1ibmFpbHx8OTQxNTgyN3x8ZW58MHx8fHx8")
//    ),
//
//    CosmeticItem(
//        name: "Гиалуроновая сыворотка",
//        brand: "The Ordinary",
//        productionDate: Calendar.current.date(byAdding: .year, value: -1, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .month, value: -8, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .month, value: -2, to: Date())!,
//        imageURL: URL(string: "https://images.unsplash.com/photo-1664530964174-ad3a5bffdbce?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTR8OTQxNTgyN3x8ZW58MHx8fHx8")
//    ),
//
//    CosmeticItem(
//        name: "Матовая помада",
//        brand: "MAC",
//        productionDate: Calendar.current.date(byAdding: .month, value: -4, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .day, value: -15, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .year, value: 1, to: Date())!,
//        imageURL: URL(string: "https://images.unsplash.com/photo-1622910076411-b126ff7e469b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTh8OTQxNTgyN3x8ZW58MHx8fHx8")
//    ),
//
//    CosmeticItem(
//        name: "Очищающий гель",
//        brand: "CeraVe",
//        productionDate: Calendar.current.date(byAdding: .month, value: -2, to: Date())!,
//        openDate: nil,
//        expiryDate: Calendar.current.date(byAdding: .month, value: 10, to: Date())!,
//        imageURL: URL(string: "https://images.unsplash.com/photo-1621265010303-a793d1017307?w=294&dpr=2&h=294&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXRodW1ibmFpbHx8OTQ4OTc1Nnx8ZW58MHx8fHx8")
//    ),
//
//    CosmeticItem(
//        name: "Увлажняющий крем для лица",
//        brand: "La Roche-Posay",
//        productionDate: Calendar.current.date(byAdding: .month, value: -3, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .day, value: -30, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .month, value: 9, to: Date())!,
//        imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr--EKOdoZkWCHWtWAs-2C6kjZ0iaNP2VNXw&s")
//    ),
//
//    CosmeticItem(
//        name: "Тонирующий BB-крем",
//        brand: "Missha",
//        productionDate: Calendar.current.date(byAdding: .month, value: -6, to: Date())!,
//        openDate: nil, // Не открыт
//        expiryDate: Calendar.current.date(byAdding: .month, value: 6, to: Date())!,
//        imageURL: URL(string: "https://images.unsplash.com/photo-1638609269435-1b4421f8585c?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NXw5NDE1ODI3fHxlbnwwfHx8fHw%3D")
//    ),
//
//    CosmeticItem(
//        name: "Гиалуроновая сыворотка",
//        brand: "The Ordinary",
//        productionDate: Calendar.current.date(byAdding: .year, value: -1, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .month, value: -8, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .month, value: -2, to: Date())!, // Просрочена
//        imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr--EKOdoZkWCHWtWAs-2C6kjZ0iaNP2VNXw&s")
//    ),
//
//    CosmeticItem(
//        name: "Матовая помада",
//        brand: "MAC",
//        productionDate: Calendar.current.date(byAdding: .month, value: -4, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .day, value: -15, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .year, value: 1, to: Date())!,
//        imageURL: URL(string: "https://images.unsplash.com/photo-1690368641595-97dfc9bd7909?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NHw5NDE1ODI3fHxlbnwwfHx8fHw%3D")
//    ),
//
//    CosmeticItem(
//        name: "Очищающий гель",
//        brand: "CeraVe",
//        productionDate: Calendar.current.date(byAdding: .month, value: -2, to: Date())!,
//        openDate: nil,
//        expiryDate: Calendar.current.date(byAdding: .month, value: 10, to: Date())!,
//        imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr--EKOdoZkWCHWtWAs-2C6kjZ0iaNP2VNXw&s")
//    ),
//    CosmeticItem(
//        name: "Увлажняющий крем для лица",
//        brand: "La Roche-Posay",
//        productionDate: Calendar.current.date(byAdding: .month, value: -3, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .day, value: -30, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .month, value: 9, to: Date())!,
//        imageURL: URL(string: "https://images.unsplash.com/photo-1654616742605-966d598a78d1?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8OHw5NDE1ODI3fHxlbnwwfHx8fHw%3D")
//    ),
//
//    CosmeticItem(
//        name: "Тонирующий BB-крем",
//        brand: "Missha",
//        productionDate: Calendar.current.date(byAdding: .month, value: -6, to: Date())!,
//        openDate: nil, // Не открыт
//        expiryDate: Calendar.current.date(byAdding: .month, value: 6, to: Date())!,
//        imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr--EKOdoZkWCHWtWAs-2C6kjZ0iaNP2VNXw&s")
//    ),
//
//    CosmeticItem(
//        name: "Гиалуроновая сыворотка",
//        brand: "The Ordinary",
//        productionDate: Calendar.current.date(byAdding: .year, value: -1, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .month, value: -8, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .month, value: -2, to: Date())!, // Просрочена
//        imageURL: URL(string: "https://images.unsplash.com/photo-1664530961956-4709f82fc69b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTJ8OTQxNTgyN3x8ZW58MHx8fHx8")
//    ),
//
//    CosmeticItem(
//        name: "Матовая помада",
//        brand: "MAC",
//        productionDate: Calendar.current.date(byAdding: .month, value: -4, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .day, value: -15, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .year, value: 1, to: Date())!,
//        imageURL: URL(string: "https://plus.unsplash.com/premium_vector-1722093079121-9d9194383aed?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGNvc21ldGljc3xlbnwwfHwwfHx8MA%3D%3D")
//    ),
//
//    CosmeticItem(
//        name: "Очищающий гель",
//        brand: "CeraVe",
//        productionDate: Calendar.current.date(byAdding: .month, value: -2, to: Date())!,
//        openDate: nil,
//        expiryDate: Calendar.current.date(byAdding: .month, value: 10, to: Date())!,
//        imageURL: URL(string: "https://images.unsplash.com/photo-1585945037805-5fd82c2e60b1?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTl8OTQxNTgyN3x8ZW58MHx8fHx8")
//    ),
//
//    CosmeticItem(
//        name: "Увлажняющий крем для лица",
//        brand: "La Roche-Posay",
//        productionDate: Calendar.current.date(byAdding: .month, value: -3, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .day, value: -30, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .month, value: 9, to: Date())!,
//        imageURL: URL(string: "https://images.unsplash.com/photo-1677511255825-78533743b356?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTd8OTQxNTgyN3x8ZW58MHx8fHx8")
//    ),
//
//    CosmeticItem(
//        name: "Тонирующий BB-крем",
//        brand: "Missha",
//        productionDate: Calendar.current.date(byAdding: .month, value: -6, to: Date())!,
//        openDate: nil, // Не открыт
//        expiryDate: Calendar.current.date(byAdding: .month, value: 6, to: Date())!,
//        imageURL: URL(string: "https://plus.unsplash.com/premium_vector-1721959218397-2b11bf094467?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGNvc21ldGljc3xlbnwwfHwwfHx8MA%3D%3D")
//    ),
//
//    CosmeticItem(
//        name: "Гиалуроновая сыворотка",
//        brand: "The Ordinary",
//        productionDate: Calendar.current.date(byAdding: .year, value: -1, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .month, value: -8, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .month, value: -2, to: Date())!, // Просрочена
//        imageURL: URL(string: "https://images.unsplash.com/photo-1532413992378-f169ac26fff0?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MjB8OTQxNTgyN3x8ZW58MHx8fHx8")
//    ),
//
//    CosmeticItem(
//        name: "Матовая помада",
//        brand: "MAC",
//        productionDate: Calendar.current.date(byAdding: .month, value: -4, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .day, value: -15, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .year, value: 1, to: Date())!,
//        imageURL: URL(string: "https://images.unsplash.com/photo-1591892212776-a09de24dbe84?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MnwzNTc4NTc2NXx8ZW58MHx8fHx8")
//    ),
//
//    CosmeticItem(
//        name: "Очищающий гель",
//        brand: "CeraVe",
//        productionDate: Calendar.current.date(byAdding: .month, value: -2, to: Date())!,
//        openDate: nil,
//        expiryDate: Calendar.current.date(byAdding: .month, value: 10, to: Date())!,
//        imageURL: URL(string: "https://plus.unsplash.com/premium_vector-1722057404548-1c10dc20b791?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGNvc21ldGljc3xlbnwwfHwwfHx8MA%3D%3D")
//    ),
//
//    CosmeticItem(
//        name: "Увлажняющий крем для лица",
//        brand: "La Roche-Posay",
//        productionDate: Calendar.current.date(byAdding: .month, value: -3, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .day, value: -30, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .month, value: 9, to: Date())!,
//        imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr--EKOdoZkWCHWtWAs-2C6kjZ0iaNP2VNXw&s")
//    ),
//
//    CosmeticItem(
//        name: "Тонирующий BB-крем",
//        brand: "Missha",
//        productionDate: Calendar.current.date(byAdding: .month, value: -6, to: Date())!,
//        openDate: nil, // Не открыт
//        expiryDate: Calendar.current.date(byAdding: .month, value: 6, to: Date())!,
//        imageURL: URL(string: "https://images.unsplash.com/photo-1620917669788-be691b2db72a?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8M3wzNTc4NTc2NXx8ZW58MHx8fHx8")
//    ),
//
//    CosmeticItem(
//        name: "Гиалуроновая сыворотка",
//        brand: "The Ordinary",
//        productionDate: Calendar.current.date(byAdding: .year, value: -1, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .month, value: -8, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .month, value: -2, to: Date())!, // Просрочена
//        imageURL: URL(string: "https://images.unsplash.com/vector-1751914323213-d3bf22ee24f0?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGNvc21ldGljc3xlbnwwfHwwfHx8MA%3D%3D")
//    ),
//
//    CosmeticItem(
//        name: "Матовая помада",
//        brand: "MAC",
//        productionDate: Calendar.current.date(byAdding: .month, value: -4, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .day, value: -15, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .year, value: 1, to: Date())!,
//        imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr--EKOdoZkWCHWtWAs-2C6kjZ0iaNP2VNXw&s")
//    ),
//
//    CosmeticItem(
//        name: "Очищающий гель",
//        brand: "CeraVe",
//        productionDate: Calendar.current.date(byAdding: .month, value: -2, to: Date())!,
//        openDate: nil,
//        expiryDate: Calendar.current.date(byAdding: .month, value: 10, to: Date())!,
//        imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr--EKOdoZkWCHWtWAs-2C6kjZ0iaNP2VNXw&s")
//    ),
//
//    CosmeticItem(
//        name: "Увлажняющий крем для лица",
//        brand: "La Roche-Posay",
//        productionDate: Calendar.current.date(byAdding: .month, value: -3, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .day, value: -30, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .month, value: 9, to: Date())!,
//        imageURL: URL(string: "https://images.unsplash.com/vector-1746131657496-e6cea68be23b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y29zbWV0aWNzfGVufDB8fDB8fHww")
//    ),
//
//    CosmeticItem(
//        name: "Тонирующий BB-крем",
//        brand: "Missha",
//        productionDate: Calendar.current.date(byAdding: .month, value: -6, to: Date())!,
//        openDate: nil, // Не открыт
//        expiryDate: Calendar.current.date(byAdding: .month, value: 6, to: Date())!,
//        imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr--EKOdoZkWCHWtWAs-2C6kjZ0iaNP2VNXw&s")
//    ),
//
//    CosmeticItem(
//        name: "Гиалуроновая сыворотка",
//        brand: "The Ordinary",
//        productionDate: Calendar.current.date(byAdding: .year, value: -1, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .month, value: -8, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .month, value: -2, to: Date())!, // Просрочена
//        imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr--EKOdoZkWCHWtWAs-2C6kjZ0iaNP2VNXw&s")
//    ),
//
//    CosmeticItem(
//        name: "Матовая помада",
//        brand: "MAC",
//        productionDate: Calendar.current.date(byAdding: .month, value: -4, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .day, value: -15, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .year, value: 1, to: Date())!,
//        imageURL: URL(string: "https://plus.unsplash.com/premium_vector-1722093079205-a4388fd249ca?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y29zbWV0aWNzfGVufDB8fDB8fHww")
//    ),
//
//    CosmeticItem(
//        name: "Очищающий гель",
//        brand: "CeraVe",
//        productionDate: Calendar.current.date(byAdding: .month, value: -2, to: Date())!,
//        openDate: nil,
//        expiryDate: Calendar.current.date(byAdding: .month, value: 10, to: Date())!,
//        imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr--EKOdoZkWCHWtWAs-2C6kjZ0iaNP2VNXw&s")
//    ),
//
//    CosmeticItem(
//        name: "Увлажняющий крем для лица",
//        brand: "La Roche-Posay",
//        productionDate: Calendar.current.date(byAdding: .month, value: -3, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .day, value: -30, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .month, value: 9, to: Date())!,
//        imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr--EKOdoZkWCHWtWAs-2C6kjZ0iaNP2VNXw&s")
//    ),
//
//    CosmeticItem(
//        name: "Тонирующий BB-крем",
//        brand: "Missha",
//        productionDate: Calendar.current.date(byAdding: .month, value: -6, to: Date())!,
//        openDate: nil, // Не открыт
//        expiryDate: Calendar.current.date(byAdding: .month, value: 6, to: Date())!,
//        imageURL: URL(string: "https://images.unsplash.com/photo-1613255348289-1407e4f2f980?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGNvc21ldGljc3xlbnwwfHwwfHx8MA%3D%3D")
//    ),
//
//    CosmeticItem(
//        name: "Гиалуроновая сыворотка",
//        brand: "The Ordinary",
//        productionDate: Calendar.current.date(byAdding: .year, value: -1, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .month, value: -8, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .month, value: -2, to: Date())!, // Просрочена
//        imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr--EKOdoZkWCHWtWAs-2C6kjZ0iaNP2VNXw&s")
//    ),
//
//    CosmeticItem(
//        name: "Матовая помада",
//        brand: "MAC",
//        productionDate: Calendar.current.date(byAdding: .month, value: -4, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .day, value: -15, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .year, value: 1, to: Date())!,
//        imageURL: URL(string: "https://plus.unsplash.com/premium_photo-1679064286466-6e1ee9d3a44d?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGNvc21ldGljc3xlbnwwfHwwfHx8MA%3D%3D")
//    ),
//
//    CosmeticItem(
//        name: "Очищающий гель",
//        brand: "CeraVe",
//        productionDate: Calendar.current.date(byAdding: .month, value: -2, to: Date())!,
//        openDate: nil,
//        expiryDate: Calendar.current.date(byAdding: .month, value: 10, to: Date())!,
//        imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr--EKOdoZkWCHWtWAs-2C6kjZ0iaNP2VNXw&s")
//    ),
//
//    CosmeticItem(
//        name: "Увлажняющий крем для лица",
//        brand: "La Roche-Posay",
//        productionDate: Calendar.current.date(byAdding: .month, value: -3, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .day, value: -30, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .month, value: 9, to: Date())!,
//        imageURL: URL(string: "https://images.unsplash.com/photo-1531646317777-0619c7c5d1d3?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGNvc21ldGljc3xlbnwwfHwwfHx8MA%3D%3D")
//    ),
//
//    CosmeticItem(
//        name: "Тонирующий BB-крем",
//        brand: "Missha",
//        productionDate: Calendar.current.date(byAdding: .month, value: -6, to: Date())!,
//        openDate: nil, // Не открыт
//        expiryDate: Calendar.current.date(byAdding: .month, value: 6, to: Date())!,
//        imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr--EKOdoZkWCHWtWAs-2C6kjZ0iaNP2VNXw&s")
//    ),
//
//    CosmeticItem(
//        name: "Гиалуроновая сыворотка",
//        brand: "The Ordinary",
//        productionDate: Calendar.current.date(byAdding: .year, value: -1, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .month, value: -8, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .month, value: -2, to: Date())!, // Просрочена
//        imageURL: URL(string: "https://images.unsplash.com/photo-1617897903246-719242758050?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Y29zbWV0aWNzfGVufDB8fDB8fHww")
//    ),
//
//    CosmeticItem(
//        name: "Матовая помада",
//        brand: "MAC",
//        productionDate: Calendar.current.date(byAdding: .month, value: -4, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .day, value: -15, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .year, value: 1, to: Date())!,
//        imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr--EKOdoZkWCHWtWAs-2C6kjZ0iaNP2VNXw&s")
//    ),
//
//    CosmeticItem(
//        name: "Очищающий гель",
//        brand: "CeraVe",
//        productionDate: Calendar.current.date(byAdding: .month, value: -2, to: Date())!,
//        openDate: nil,
//        expiryDate: Calendar.current.date(byAdding: .month, value: 10, to: Date())!,
//        imageURL: URL(string: "https://plus.unsplash.com/premium_photo-1670514095985-fc253f2e86c6?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8Y29zbWV0aWNzfGVufDB8fDB8fHww")
//    ),
//
//    CosmeticItem(
//        name: "Увлажняющий крем для лица",
//        brand: "La Roche-Posay",
//        productionDate: Calendar.current.date(byAdding: .month, value: -3, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .day, value: -30, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .month, value: 9, to: Date())!,
//        imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr--EKOdoZkWCHWtWAs-2C6kjZ0iaNP2VNXw&s")
//    ),
//
//    CosmeticItem(
//        name: "Тонирующий BB-крем",
//        brand: "Missha",
//        productionDate: Calendar.current.date(byAdding: .month, value: -6, to: Date())!,
//        openDate: nil, // Не открыт
//        expiryDate: Calendar.current.date(byAdding: .month, value: 6, to: Date())!,
//        imageURL: URL(string: "https://images.unsplash.com/photo-1577058109956-67adf6edc586?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y29zbWV0aWNzfGVufDB8fDB8fHww")
//    ),
//
//    CosmeticItem(
//        name: "Гиалуроновая сыворотка",
//        brand: "The Ordinary",
//        productionDate: Calendar.current.date(byAdding: .year, value: -1, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .month, value: -8, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .month, value: -2, to: Date())!, // Просрочена
//        imageURL: URL(string: "https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y29zbWV0aWNzfGVufDB8fDB8fHww")
//    ),
//
//    CosmeticItem(
//        name: "Матовая помада",
//        brand: "MAC",
//        productionDate: Calendar.current.date(byAdding: .month, value: -4, to: Date())!,
//        openDate: Calendar.current.date(byAdding: .day, value: -15, to: Date())!,
//        expiryDate: Calendar.current.date(byAdding: .year, value: 1, to: Date())!,
//        imageURL: URL(string: "https://images.unsplash.com/photo-1598460880248-71ec6d2d582b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29zbWV0aWNzfGVufDB8fDB8fHww")
//    ),
//
//    CosmeticItem(
//        name: "Очищающий гель",
//        brand: "CeraVe",
//        productionDate: Calendar.current.date(byAdding: .month, value: -2, to: Date())!,
//        openDate: nil,
//        expiryDate: Calendar.current.date(byAdding: .month, value: 10, to: Date())!,
//        imageURL: URL(string: "https://plus.unsplash.com/premium_photo-1674739375749-7efe56fc8bbb?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y29zbWV0aWNzfGVufDB8fDB8fHww")
//    )
//]

