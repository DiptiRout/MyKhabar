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
    
    var body: some View
    {
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
                            
                            ForEach(viewModel.paginatedNews.indices, id: \.self) { index in
                                Button {
                                    if let url = URL(string: viewModel.paginatedNews[index].url) {
                                        router.navigate(to: .webView(url: url))
                                    }
                                } label: {
                                    NewsListSmallCell(news: viewModel.paginatedNews[index])
                                }
                                .buttonStyle(PlainButtonStyle())
                                .onAppear {
                                    if index == viewModel.paginatedNews.count - 1 {
                                        viewModel.fetchNews()
                                    }
                                }
                            }
                            
                        } header: {
                            LatestNewsHeader(selectedTab: self.$selectedTab)
                            .background(Color(.systemBackground).ignoresSafeArea())
                        }
                        
                    }
                    .onAppear {
                        viewModel.fetchNews()
                        
                    }
                    Spacer()
                }
            }
    }
}


#Preview {
    HomePageView(viewModel: .init())
}

//Color.primary          // Adapts between black & white
//Color.secondary        // Slightly lighter than primary
//Color.tertiary        // Even lighter than secondary
//Color.quaternary      // The lightest adaptive color
