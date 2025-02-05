//
//  HomePageView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 26/01/25.
//

import SwiftUI

struct HomePageView: View {
    
    @ObservedObject private var router = Router.shared
    
    @StateObject var viewModel = HomePageViewModel()
    @State private var searchText: String = ""
    @State private var selectedTab = 0
    @State private var showWebView = false
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            HomePageHeaderView {
                router.navigate(to: .notification)
            }
            
            ScrollView {
                LazyVStack(pinnedViews: .sectionHeaders) {
                    
                    Section {
                        if let firstNews = viewModel.getLatestNews() {
                            NewsListLargeCell(news: firstNews)
                        } else {
                            ProgressView()
                        }
                    } header: {
                        VStack {
                            
                            SearchHeaderView(searchText: $searchText,
                                             uiModel: viewModel.uiModel)
                            
                            HStack {
                                Text("Trending")
                                    .font(.headline)
                                Spacer()
                                Button(action: {}) {
                                    Text("See all")
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.top)
                            .padding(.leading)
                            .padding(.trailing)
                        }
                        .background(Color(.systemBackground).ignoresSafeArea())
                        
                    }
                    
                    Section {
                        let key = viewModel.tabBarOptions[selectedTab]
                        if let items = viewModel.paginatedNewsDict[key] {
                            ForEach(items.indices, id: \.self) { index in
                                Button {
                                    if let url = URL(string: items[index].url) {
                                        router.navigate(to: .webView(url: url))
                                    }
                                } label: {
                                    NewsListSmallCell(news: items[index])
                                }
                                .buttonStyle(PlainButtonStyle())
                                .onAppear {
                                    if index == items.count - 1 {
                                        viewModel.fetchNews(with: selectedTab)
                                    }
                                }
                            }
                        }
                        
                    } header: {
                        VStack {
                            HStack {
                                Text("Latest")
                                    .font(.headline)
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Text("See all")
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.top)
                            .padding(.horizontal)
                            
                            CategoryTabBarView(
                                currentTab: self.$selectedTab,
                                tabBarOptions: viewModel.tabBarOptions
                            ) {
                                viewModel.fetchNews(with: selectedTab)
                            }
                        }
                        .background(Color(.systemBackground).ignoresSafeArea())
                    }
                    
                }
                .onAppear {
                    viewModel.fetchNews(with: selectedTab)
                    
                }
                Spacer()
            }
        }
        .alert("Error", isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(viewModel.errorMessage ?? "Unknown error")
        }
        .onChange(of: viewModel.errorMessage) { newValue in
            if newValue != nil {
                showAlert = true
            }
        }
    }
}

#Preview {
    HomePageView(viewModel: .init())
}
