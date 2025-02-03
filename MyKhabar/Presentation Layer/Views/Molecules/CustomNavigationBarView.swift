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
                Button(action: {
                    print("Back tapped")
                }) {
                    Image(systemName: "arrow.backward")
                }
            }

            ToolbarItem(placement: .principal) {
                Text("Centered Title")
                    .font(.headline)
            }

            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    print("Edit tapped")
                }) {
                    Image(systemName: "pencil")
                }
            }
        }
        .toolbarBackground(Color.blue, for: .navigationBar) // Custom background color
        .toolbarBackground(.visible, for: .navigationBar)   // Make the background visible
    }
}

//struct ContentView: View {
//    var body: some View {
//        NavigationStack {
//            NavigationLink("Go to Custom View", destination: CustomNavigationBarView())
//                .padding()
//                .navigationTitle("Main View")
//        }
//    }
//}


#Preview {
    CustomNavigationBarView()
}
