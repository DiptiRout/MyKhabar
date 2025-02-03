//
//  NewsAPIUseCase.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 29/01/25.
//

protocol NewsAPIUseCaseProtocol: Sendable {
    func fetchNews() async throws -> [NewsEntityDTO]
    func fetchNews(with categgory: String) async throws -> [NewsEntityDTO]
}


final class NewsAPIUseCase: NewsAPIUseCaseProtocol {
    private let repository: NewsAPIRepository
    
    init(repository: NewsAPIRepository) {
        self.repository = repository
    }
    
    func fetchNews() async throws -> [NewsEntityDTO] {
        try await repository.fetchNews().map { entity in
            entity.toEntityDTO()
        }
    }
    
    func fetchNews(with categgory: String) async throws -> [NewsEntityDTO] {
        try await repository.fetchNews(with: categgory).map { entity in
            entity.toEntityDTO()
        }
    }
    
}
