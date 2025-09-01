//
//  ArrayUtils.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 01.09.2025.
//

extension Array {
    func getSafe(at index: Int) -> Element? {
        guard index >= 0 && index < count else { return nil }
        return self[index]
    }
}
