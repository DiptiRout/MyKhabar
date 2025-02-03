//
//  NewsEntityDTO.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 29/01/25.
//

import Foundation


struct NewsEntityDTO: Decodable, Identifiable {
    var id = UUID()
    let author: String
    let title: String
    let description: String
    let url: String
    let source: String
    let image: String
    let category: String
    let publishedAt: String

    var publishedDate: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter.date(from: publishedAt)
    }
}

