//
//  ProfilePageView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 29/01/25.
//

import SwiftUI

struct ProfilePageView: View {
    @State private var selectedTab = 0 // Tab selection
    @StateObject private var viewModel = ProfileViewModel()
    @ObservedObject private var router = Router.shared

    var body: some View {
        VStack {
            // Profile Header
            VStack {
                // Profile Image & Stats
                    HStack(spacing: 32) {
                        Image("profile_photo") // Replace with actual image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .background(Color.red)
                            .clipShape(Circle())
                        
                        // Stats
                        ProfileStatView(count: 2156, label: "Followers")
                        ProfileStatView(count: 567, label: "Following")
                        ProfileStatView(count: 23, label: "News")
                    }
                VStack(alignment: .leading) {
                    Text("Wilson Franci")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.top, 4)
                    
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }
                
                // Edit Profile & Website Buttons
                HStack {
                    AppPrimaryButton(uiModel: AppPrimaryButtonUIModel(
                        buttonWidth: ScaledDesign.scaleWidth(180)),
                                     title: "Edit Profile"
                    ) {
                        router.navigate(to: .editProfile)
                    }
                    Spacer()
                    AppPrimaryButton(uiModel: AppPrimaryButtonUIModel(
                        buttonWidth: ScaledDesign.scaleWidth(180)),
                                     title: "Website"
                    ) {
                        
                    }
                }
                .padding()
            }

            // News List
            ScrollView {
                LazyVStack(spacing: 16) {
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
                                    Task {
                                        viewModel.fetchNews()
                                    }
                                }
                            }
                        }
                    } header: {
                        CategoryTabBarView(currentTab: $selectedTab)
                    }
                    
                }
            }
        }
        .onAppear {
            viewModel.fetchNews()
            
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarRole(.browser)
    }
}

// Profile Stats View
struct ProfileStatView: View {
    let count: Int
    let label: String
    
    var body: some View {
        VStack {
            Text("\(count)")
                .font(.headline)
                .fontWeight(.bold)
            Text(label)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    ProfilePageView()
}
