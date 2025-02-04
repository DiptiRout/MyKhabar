//
//  NewsSourceSelectionView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 28/01/25.
//

import SwiftUI

struct NewsSourceSelectionView: Identifiable {
    let id = UUID()
    let name: String
    let image: String // Use systemName for SF Symbols or asset name
}

struct NewsSourceView: View {
    
    @ObservedObject private var router = Router.shared

    let newsSources = [
        NewsSourceSelectionView(name: "CNBC", image: "cnbc-logo"),
        NewsSourceSelectionView(name: "VICE", image: "vice-logo"),
        NewsSourceSelectionView(name: "Vox", image: "vox-logo"),
        NewsSourceSelectionView(name: "BBC News", image: "bbc-logo"),
        NewsSourceSelectionView(name: "SCMP", image: "scmp-logo"),
        NewsSourceSelectionView(name: "CNN", image: "cnn-logo"),
        NewsSourceSelectionView(name: "MSN", image: "msn-logo"),
        NewsSourceSelectionView(name: "CNET", image: "cnet-logo"),
        NewsSourceSelectionView(name: "USA Today", image: "usa-today-logo"),
        NewsSourceSelectionView(name: "TIME", image: "time-logo"),
        NewsSourceSelectionView(name: "Buzzfeed", image: "buzzfeed-logo"),
        NewsSourceSelectionView(name: "Daily Mail", image: "dailymail-logo")
    ]
    
    @State private var followingSources: Set<UUID> = []
    
    let uiModel = OutlinedTextFieldUIModel(
        height: ScaledDesign.scaleHeight(48),
        rightViewImage: "magnifyingglass"
    )

    var body: some View {
        VStack {
            // Header and Search Bar
            SearchHeaderView(searchText: .constant(""), uiModel: uiModel)
                .padding(.bottom)

            // Dynamic Grid
            ScrollView {
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: 120), spacing: 16)],
                    spacing: 16
                ) {
                    ForEach(newsSources) { source in
                        VStack(spacing: 8) {
                            Image(source.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(30)

                            Text(source.name)
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.black)

                            Button(action: {
                                if followingSources.contains(source.id) {
                                    followingSources.remove(source.id)
                                } else {
                                    followingSources.insert(source.id)
                                }
                            }) {
                                Text(followingSources.contains(source.id) ? "Following" : "Follow")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(followingSources.contains(source.id) ? .white : .blue)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 8)
                                    .background(
                                        followingSources.contains(source.id) ? Color.blue : Color.white
                                    )
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.blue, lineWidth: 1)
                                    )
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                    }
                }
                .padding(.horizontal)
            }

            // Next Button
            AppPrimaryButton(uiModel: AppPrimaryButtonUIModel(), title: "Next") {
                router.navigate(to: .accountConfirm)
            }
            .applyBottomContainerTopShadow()

        }
        .padding(.top)
        .navigationTitle("Select a Country")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NewsSourceView()
}
