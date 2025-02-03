//
//  NewsAPIRepository.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 29/01/25.
//


protocol NewsAPIRepository: Sendable {
    func fetchNews() async throws -> [NewsEntity]
    func fetchNews(with category: String) async throws -> [NewsEntity]
}
