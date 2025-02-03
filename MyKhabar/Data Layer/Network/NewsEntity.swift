//
//  NewsEntity.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 29/01/25.
//

import UIKit

struct PaginatedNewsResponse: Decodable {
    let pagination: Pagination
    let data: [NewsEntity]
}

struct Pagination: Decodable {
    let limit: Int
    let offset: Int
    let count: Int
    let total: Int
}

struct NewsEntity: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let source: String?
    let image: String?
    let category: String?
    let publishedAt: String?
}


