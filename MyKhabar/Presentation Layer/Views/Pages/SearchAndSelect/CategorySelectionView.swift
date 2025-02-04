//
//  CategorySelectionView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 28/01/25.
//

import SwiftUI

struct CategorySelectionView: View {
    
    @ObservedObject private var router = Router.shared
    @State private var searchText: String = ""
    @State private var selectedTopics: Set<String> = []
    let uiModel = OutlinedTextFieldUIModel(
        height: ScaledDesign.scaleHeight(48),
        rightViewImage: "magnifyingglass"
    )
    let topics = [
        "National", "International", "Sport", "Lifestyle", "Business",
        "Health", "Fashion", "Technology", "Science", "Art", "Politics"
    ]
    
    var body: some View {
        VStack {
            // Search Bar
            SearchHeaderView(searchText: $searchText,
                             uiModel: uiModel)
            .padding(.bottom)
            // Dynamic Grid
            ScrollView {
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: 100), spacing: 16)],
                    spacing: 16
                ) {
                    ForEach(topics, id: \.self) { topic in
                        Button(action: {
                            if selectedTopics.contains(topic) {
                                selectedTopics.remove(topic)
                            } else {
                                selectedTopics.insert(topic)
                            }
                        }) {
                            Text(topic)
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(selectedTopics.contains(topic) ? .white : .blue)
                                .padding(.vertical, 12)
                                .frame(maxWidth: .infinity)
                                .background(
                                    selectedTopics.contains(topic) ? Color.blue : Color.white
                                )
                                .cornerRadius(6)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(Color.blue, lineWidth: 1)
                                )
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            AppPrimaryButton(uiModel: AppPrimaryButtonUIModel(), title: "Next") {
                router.navigate(to: .sourceSelection)
            }
            .applyBottomContainerTopShadow()
            
        }
        .padding(.top)
    }
}

#Preview {
    CategorySelectionView()
}
