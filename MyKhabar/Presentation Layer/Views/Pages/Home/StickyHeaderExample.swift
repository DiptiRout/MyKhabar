//
//  StickyHeaderExample.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 27/01/25.
//


import SwiftUI

struct StickyHeaderExample: View {
    var body: some View {
        ScrollView {
            LazyVStack(pinnedViews: .sectionHeaders) {
                Section {
                    Text("View A")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding()
                }

                Section {
                    ForEach(0..<15) { i in
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("Row \(i)")
                                .font(.subheadline)
                                .padding()
                        }
                        .background(i % 2 == 0 ? Color.gray.opacity(0.1) : Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal)
                    }
                } header: {
                    Text("View B - Sticky")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.top)
                }
            }
        }
    }
}


#Preview {
    StickyHeaderExample()
}
