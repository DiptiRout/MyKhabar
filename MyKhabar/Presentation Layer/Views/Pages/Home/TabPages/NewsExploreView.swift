//
//  NewsExploreView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 27/01/25.
//

import SwiftUI

struct NewsExploreView: View {
    
    @ObservedObject private var router = Router.shared
    @StateObject var viewModel = NewsExploreViewModel()
    
    var body: some View {
            
            ScrollView {
                LazyVStack(pinnedViews: .sectionHeaders) {
                    
                    Section {
                        if let firstNews = viewModel.paginatedNews.first {
                            NewsCategoryTopicCell(news: firstNews)
                        } else {
                            ProgressView()
                        }
                        
                    } header: {
                        HStack {
                            Text("Topic")
                                .font(.headline)
                            Spacer()
                            Button(action: {}) {
                                Text("See all")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.leading)
                        .padding(.trailing)
                    }
                    .padding(.bottom)
                    
                    Section {
                        ForEach(viewModel.paginatedNews.indices, id: \.self) { index in
                            Button {
                                if let url = URL(string: viewModel.paginatedNews[index].url) {
                                    router.navigate(to: .webView(url: url))
                                }
                            } label: {
                                NewsListLargeCell(news: viewModel.paginatedNews[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .onAppear {
                                if index == viewModel.paginatedNews.count - 1 {
                                    Task {
                                        viewModel.fetchNews()
                                    }
                                }
                            }
                        }
                        
                    } header: {
                        VStack {
                            HStack {
                                Text("Popular Topic")
                                    .font(.headline)
                                Spacer()
                            }
                            .padding(.leading)
                            .padding(.trailing)
                        }
                    }
                    
                }
                .onAppear {
                    viewModel.fetchNews()
                }
                Spacer()
                
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.visible, for: .navigationBar)
    }
}

#Preview {
    NewsExploreView()
}
