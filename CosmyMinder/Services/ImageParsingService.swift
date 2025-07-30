//
//  ImageParsingService.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 30.07.2025.
//

import Vision
import NaturalLanguage
import UIKit

class ImageParser {
    func addNewCosmeticItem() {
        parseCosmetic { cosmeticItem in
            guard let item = cosmeticItem else {
                print("Не удалось распознать данные")
                return
            }
            // Используем распознанный item
            print("Распознанный продукт: \(item)")
        }
    }

    func parseCosmetic(completion: @escaping (CosmeticItem?) -> Void) {
        let image = UIImage(named: "shis")
        recognizeTextFromImage((image?.cgImage!)!) { recognizedText in
            guard let text = recognizedText else {
                completion(nil)
                return
            }
            print(recognizedText ?? "")

            // 2. Анализируем содержимое и возвращаем результат
            let cosmeticData = self.extractCosmeticData(from: text)
            completion(cosmeticData)
        }
    }

    private func recognizeTextFromImage(_ image: CGImage, completion: @escaping (String?) -> Void) {

        let request = VNRecognizeTextRequest { request, error in
            if let error = error {
                print("Ошибка распознавания текста: \(error.localizedDescription)")
                completion(nil)
                return
            }

            guard let observations = request.results as? [VNRecognizedTextObservation] else {
                completion(nil)
                return
            }

            let text = observations.compactMap { $0.topCandidates(1).first?.string }.joined(separator: "\n")

            completion(text)
        }

        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = true
        request.recognitionLanguages =  ["en", "ru", "fr", "de", "ja"]

        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(cgImage: image, options: [:])
            try? handler.perform([request])
        }
    }

    private func extractCosmeticData(from text: String) -> CosmeticItem {
        let brand = detectBrand(in: text)
        let dates = detectDates(in: text)
        let productName = extractProductName(from: text, brand: brand, dates: dates)

        return CosmeticItem(
            name: productName,
            brand: brand,
            productionDate: dates.first,
            expiryDate: dates.last
        )
    }

    private func detectBrand(in text: String) -> String {
        let tagger = NLTagger(tagSchemes: [.nameType])
        tagger.string = text
        var brands = [String]()
        let range = text.startIndex..<text.endIndex

        tagger.enumerateTags(in: range, unit: .word, scheme: .nameType) { tag, range in
            if tag == .organizationName {
                brands.append(String(text[range]))
            }
            return true
        }

        return brands.first ?? "Unknown"
    }

    private func detectDates(in text: String) -> [Date] {
        let patterns = [
            #"\b\d{2}[./-]\d{2}[./-]\d{2,4}\b"#,  // DD.MM.YYYY или DD/MM/YY и т.д.
            #"\b(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)[a-z]* \d{1,2},? \d{4}\b"#,  // Месяц день год
            #"\b\d{1,2} (?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)[a-z]* \d{4}\b"#,  // День месяц год
            #"\b\d{4}[./-]\d{2}[./-]\d{2}\b"#  // YYYY-MM-DD
        ]

        let dateFormats = [
            "dd.MM.yyyy", "dd/MM/yyyy", "dd-MM-yyyy",
            "MMM d, yyyy", "d MMM yyyy",
            "yyyy.MM.dd", "yyyy/MM/dd", "yyyy-MM-dd"
        ]

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")

        var foundDates = [Date]()

        for pattern in patterns {
            guard let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) else {
                continue
            }

            let matches = regex.matches(in: text, range: NSRange(text.startIndex..., in: text))

            for match in matches {
                guard let range = Range(match.range, in: text) else { continue }
                let dateString = String(text[range])

                for format in dateFormats {
                    dateFormatter.dateFormat = format
                    if let date = dateFormatter.date(from: dateString) {
                        foundDates.append(date)
                        break
                    }
                }
            }
        }

        return foundDates
    }

    private func extractProductName(from text: String, brand: String, dates: [Date]) -> String {
        var cleanedText = text
        cleanedText = cleanedText.replacingOccurrences(of: brand, with: "", options: .caseInsensitive)

        let dateStrings = dates.compactMap { DateFormatter.cosmeticDate.string(from: $0) }
        dateStrings.forEach { cleanedText = cleanedText.replacingOccurrences(of: $0, with: "") }

        return cleanedText.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

// Расширение для DateFormatter
extension DateFormatter {
    static let cosmeticDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM.yyyy"
        return formatter
    }()
}
