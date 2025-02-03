//
//  LatestNewsHeader.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 31/01/25.
//

import SwiftUI

struct LatestNewsHeader: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack {
            HStack {
                Text("Latest")
                    .font(.headline)
                Spacer()
                Button(action: {}) {
                    Text("See all")
                        .foregroundColor(.gray)
                }
            }
            .padding(.top)
            .padding(.horizontal)
            
            CategoryTabBarView(currentTab: self.$selectedTab)
        }
    }
}
