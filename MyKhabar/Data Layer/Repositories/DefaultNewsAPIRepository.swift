//
//  DefaultNewsAPIRepository.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 29/01/25.
//

import Foundation

final actor DefaultNewsAPIRepository: NewsAPIRepository {
    
    private let apiService = NetworkService()
    private let accessKey = "a39900ce2fd5125e8a78cbfb5d1bcc6c"
    private let baseURL = "http://api.mediastack.com/v1"
    private let countryCode = "in"

    // Pagination state
    private var currentPage: Int = 1
    private let pageSize: Int = 20
    private var isFetching: Bool = false
    private var hasMoreData: Bool = true

    func resetPagination() {
        currentPage = 1
        hasMoreData = true
        isFetching = false
    }

    func fetchNews() async throws -> [NewsEntity] {
        guard !isFetching, hasMoreData else {
            return []
        }
        
        isFetching = true
        defer { isFetching = false }

        let offset = (currentPage - 1) * pageSize
        let path = "/news"
        let param: [String: String] = ["country": "us",
                     "limit": "\(pageSize)",
                     "offset": "\(offset)",
                     "access_key": "6725f164d73fed68929a5ddc92ee41f6"]
        do {
            let news: PaginatedNewsResponse = try await apiService.fetchData(from: baseURL,
                                                                             path: path,
                                                                             params: param,
                                                                             errorType: NewsAPIErrorResponse.self)
            if news.data.isEmpty {
                hasMoreData = false
            } else {
                currentPage += 1
            }
            return news.data
        } catch {
            throw error
        }
    }

    func fetchNews(with category: String) async throws -> [NewsEntity] {
        guard !isFetching, hasMoreData else { return [] }
        
        isFetching = true
        defer { isFetching = false }

        let offset = (currentPage - 1) * pageSize
        let path = "/news"
        let param: [String: String] = ["country": "us",
                                       "category": "\(category)",
                                        "limit": "\(pageSize)",
                                        "offset": "\(offset)",
                                        "access_key": "6725f164d73fed68929a5ddc92ee41f6"]
        do {
            let news: PaginatedNewsResponse = try await apiService.fetchData(from: baseURL,
                                                                             path: path,
                                                                             params: param,
                                                                             errorType: NewsAPIErrorResponse.self)
            if news.data.isEmpty {
                hasMoreData = false
            } else {
                currentPage += 1
            }
            return news.data
        } catch {
            throw error
        }
    }
}
