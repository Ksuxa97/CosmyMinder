//
//  DateFormatter.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 20.08.2025.
//
import Foundation

extension DateFormatter {
    static let ddMMYY: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        return formatter
    }()
}
