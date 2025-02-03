//
//  Country.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 28/01/25.
//


import SwiftUI

struct Country: Identifiable {
    let id = UUID()
    let name: String
    let flag: String
}

struct CountrySelectionView: View {
    
    @ObservedObject private var router = Router.shared
    @State private var searchText: String = ""
    @State private var selectedCountry: Country? = nil
    @State private var isNextButtonActive: Bool = false

    private let countries: [Country] = [
        Country(name: "United States", flag: "🇺🇸"),
        Country(name: "Canada", flag: "🇨🇦"),
        Country(name: "United Kingdom", flag: "🇬🇧"),
        Country(name: "Germany", flag: "🇩🇪"),
        Country(name: "France", flag: "🇫🇷"),
        Country(name: "Japan", flag: "🇯🇵"),
        Country(name: "India", flag: "🇮🇳")
    ]

    var filteredCountries: [Country] {
        if searchText.isEmpty {
            return countries
        } else {
            return countries.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    let uiModel = OutlinedTextFieldUIModel(
        height: ScaledDesign.scaleHeight(48),
        rightViewImage: "magnifyingglass"
    )

    var body: some View {
            VStack {
                // Search Bar
                SearchHeaderView(searchText: $searchText,
                                 uiModel: uiModel)

                // Country List
                List(filteredCountries) { country in
                    
                    HStack {
                        Text(country.flag)
                            .font(.largeTitle)
                        Text(country.name)
                            .font(.headline)
                        Spacer()
                        if selectedCountry?.id == country.id {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.blue)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedCountry = country
                        isNextButtonActive = true
                    }
                }
                .listStyle(PlainListStyle())

                // Next Button
                AppPrimaryButton(uiModel: AppPrimaryButtonUIModel(), title: "Next", isDisabled: selectedCountry == nil) {
                    router.navigate(to: .sourceSelection)
                }
                .applyBottomContainerTopShadow()
            }
            .navigationTitle("Select a Country")
            .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    CountrySelectionView()
}
