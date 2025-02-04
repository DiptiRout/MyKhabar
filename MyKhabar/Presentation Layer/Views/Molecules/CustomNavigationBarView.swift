//
//  CustomNavigationBarView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 26/01/25.
//

import SwiftUI

struct CustomNavigationBarView: View {
    var body: some View {
        VStack {
            Text("This view has a custom navigation bar")
                .padding()
        }
        .navigationTitle("Custom Title")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.blue, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbar {
            // Add custom buttons to the navigation bar
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    print("Back tapped")
                } label: {
                    Image(systemName: "arrow.backward")
                }
            }

            ToolbarItem(placement: .principal) {
                Text("Centered Title")
                    .font(.headline)
            }

            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    print("Edit tapped")
                } label: {
                    Image(systemName: "pencil")
                }
            }
        }
        .toolbarBackground(Color.blue, for: .navigationBar) // Custom background color
        .toolbarBackground(.visible, for: .navigationBar)   // Make the background visible
    }
}

#Preview {
    CustomNavigationBarView()
}
