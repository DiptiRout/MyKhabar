//
//  HomePageViewModel.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 29/01/25.
//

import Foundation

@MainActor
class HomePageViewModel: ObservableObject {
    
    @Dependency private var fetchNewsUseCase: NewsAPIUseCaseProtocol
    @Published var news: [NewsEntityDTO] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var paginatedNewsDict: [String: [NewsEntityDTO]] = [:]


    let uiModel = OutlinedTextFieldUIModel(
        height: ScaledDesign.scaleHeight(48),
        rightViewImage: "slider.horizontal.3", 
        leftViewImage: "magnifyingglass"
    )
    
    let vm = NewsEntityDTO(id: UUID(),
                           author: "Testing news descriptions. Two line text showing in single frame.",
                           title: "Testing news descriptions. Two line statements. This is very long text.",
                           description: "Konoha",
                           url: "www.google.com",
                           source: "Ninja News",
                           image: "https://imagez.tmz.com/image/fa/4by3/2020/08/04/fad55ee236fc4033ba324e941bb8c8b7_md.jpg",
                           category: "Ninja",
                           publishedAt: "2025-01-29T07:23:05+00:00"
    )
    
    var tabBarOptions: [String] = ["General",
                                   "Business",
                                   "Entertainment",
                                   "Health",
                                   "Science", "Sports", "Technology"]
    
    func fetchNews(with category: Int) {
        Task {
//            news = [vm, vm, vm, vm, vm]
            await loadNews(with: tabBarOptions[category])
        }
    }

    private func loadNews(with category: String) async {
        isLoading = true
        errorMessage = nil

        do {
            let fetchedNews = try await fetchNewsUseCase.fetchNews(
                with: category
            )
            news = fetchedNews
            paginatedNewsDict[category, default: []]
                .append(contentsOf: news)
        } catch {
            if let error = (error as? NewsAPIErrorResponse)?.error {
                errorMessage = "Failed to fetch news: \(error.message)"
            } else {
                errorMessage = "Failed to fetch news: \(error.localizedDescription)"
            }
        }

        isLoading = false
    }
    
    func getLatestNews() -> NewsEntityDTO? {
        return news.max {
            ($0.publishedDate ?? Date.distantPast) < ($1.publishedDate ?? Date.distantPast)
        }
    }
}
