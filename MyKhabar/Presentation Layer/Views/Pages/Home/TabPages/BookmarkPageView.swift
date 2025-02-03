//
//  BookmarkPageView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 27/01/25.
//

import SwiftUI

struct BookmarkPageView: View {
    @State private var searchText: String = ""
    
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
    
    let uiModel = OutlinedTextFieldUIModel(
        height: ScaledDesign.scaleHeight(48),
        rightViewImage: "slider.horizontal.3",
        leftViewImage: "magnifyingglass"
    )


    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, pinnedViews: .sectionHeaders) {
                Section {
                    ForEach(0...3, id: \.self) { index in
                        NewsListSmallCell(news: vm)
                    }
                } header: {
                    SearchHeaderView(searchText: $searchText,
                                     uiModel: uiModel)
                }
            }
        }
    }
}

#Preview {
    BookmarkPageView()
}
