//
//  CategoryTabBarView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 27/01/25.
//

import SwiftUI

struct CategoryTabBarView: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    @State private var contentWidth: CGFloat = 0
    @State private var contentHeight: CGFloat = 0

    let tabBarOptions: [String]
    let itemSpacing: CGFloat = 20
    let tabSwitch: () -> Void

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: itemSpacing) {
                ForEach(Array(zip(self.tabBarOptions.indices,
                                  self.tabBarOptions)),
                        id: \.0,
                        content: { index, name in
                    TabBarItem(currentTab: self.$currentTab,
                               namespace: namespace.self,
                               tabBarItemName: name,
                               tab: index) {
                        tabSwitch()
                    }
                    .background(
                        GeometryReader { geometry in
                            Color.clear.onAppear {
                                contentWidth += geometry.size.width
                                contentHeight = geometry.size.height
                            }
                        }
                    )
                })
            }
            .padding(.horizontal)
        }
        .scrollDisabled(false)
        .frame(height: contentHeight)
        .edgesIgnoringSafeArea(.all)
        .if(contentWidth < UIScreen.main.bounds.width) {
            $0.frame(width: contentWidth + (itemSpacing * CGFloat(tabBarOptions.count)))
         }
        .frame(maxWidth: .infinity)
    }
}

struct TabBarItem: View {
    @Binding var currentTab: Int
    let namespace: Namespace.ID
    var tabBarItemName: String
    var tab: Int
    let tabSwitch: () -> Void

    var body: some View {
        Button {
            self.currentTab = tab
            tabSwitch()
        } label: {
            VStack {
                Spacer()
                Text(tabBarItemName)
                if currentTab == tab {
                    AppColors.appPrimary
                        .frame(height: 4)
                        .matchedGeometryEffect(id: "underline",
                                               in: namespace,
                                               properties: .frame)
                } else {
                    Color.clear.frame(height: 2)
                }
            }
            .animation(.spring(), value: self.currentTab)
            .padding(.bottom)
        }
        .buttonStyle(.plain)
    }
}

#Preview(body: {
    CategoryTabBarView(currentTab: .constant(1), tabBarOptions: ["All", "Games"]) {
    }
        .background(Color.red)
})
