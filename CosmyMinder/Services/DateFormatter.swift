//
//  DateFormatter.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 20.08.2025.
//
import Foundation

class DateFormatterManager {
    static let shared = DateFormatterManager()

    let ddMMyyFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yy"
            return formatter
        }()

    private init() {}
}
