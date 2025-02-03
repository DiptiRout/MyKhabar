//
//  NewsTabsPageContainerView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 27/01/25.
//

import SwiftUI

struct NewsTabsPageContainerView: View {
    
    var body: some View {
            TabView {
                HomePageView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                
                NewsExploreView()
                    .tabItem {
                        Image(systemName: "safari")
                            .renderingMode(.original)
                        Text("Explore")
                    }
                
                BookmarkPageView()
                    .tabItem {
                        Image(systemName: "bookmark")
                        Text("Bookmark")
                    }
                
                ProfilePageView()
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    }
            }
            .accentColor(.blue)
    }
}

#Preview {
    NewsTabsPageContainerView()
}
