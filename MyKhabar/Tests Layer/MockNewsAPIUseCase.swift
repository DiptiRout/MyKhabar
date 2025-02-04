//
//  MockNewsAPIUseCase.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 30/01/25.
//

import SwiftUI

// Mock implementation of NewsAPIUseCaseProtocol for Preview
final class MockNewsAPIUseCase: NewsAPIUseCaseProtocol {
    func fetchNews(with categgory: String) async throws -> [NewsEntityDTO] {
        return [
            NewsEntityDTO(id: UUID(),
                          author: "Testing news descriptions. Two line text showing in single frame.",
                          title: "Testing news descriptions. Two line statements. This is very long text.",
                          description: "Konoha",
                          url: "www.google.com",
                          source: "Ninja News",
                          image: "",
                          category: "Ninja",
                          publishedAt: "2025-01-29T07:23:05+00:00"),
            
            NewsEntityDTO(id: UUID(),
                          author: "Testing news descriptions. Two line text showing in single frame.",
                          title: "Testing news descriptions. Two line statements. This is very long text.",
                          description: "Konoha",
                          url: "www.google.com",
                          source: "Ninja News",
                          image: "",
                          category: "Ninja",
                          publishedAt: "2025-01-29T07:23:05+00:00"
                         )
            
        ]
    }
    
    func fetchNews() async throws -> [NewsEntityDTO] {
        
        return [
            NewsEntityDTO(id: UUID(),
                          author: "Testing news descriptions. Two line text showing in single frame.",
                          title: "Testing news descriptions. Two line statements. This is very long text.",
                          description: "Konoha",
                          url: "www.google.com",
                          source: "Ninja News",
                          image: "",
                          category: "Ninja",
                          publishedAt: "2025-01-29T07:23:05+00:00"
                         ),
            
            NewsEntityDTO(id: UUID(),
                          author: "Testing news descriptions. Two line text showing in single frame.",
                          title: "Testing news descriptions. Two line statements. This is very long text.",
                          description: "Konoha",
                          url: "www.google.com",
                          source: "Ninja News",
                          image: "",
                          category: "Ninja",
                          publishedAt: "2025-01-29T07:23:05+00:00"
                         )
            
        ]
    }
}
