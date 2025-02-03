//
//  SearchHeaderView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 31/01/25.
//

import SwiftUI

struct SearchHeaderView: View {
    @Binding var searchText: String
    let uiModel: OutlinedTextFieldUIModel
    
    var body: some View {
        VStack {
            TextField("Search", text: $searchText)
                .applyOutlinedStyle(textFieldType: .searchTextField,
                                    uiModel: uiModel)
                .padding(.top, 4)
        }
    }
}
