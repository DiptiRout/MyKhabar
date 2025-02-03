//
//  SettingsView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 29/01/25.
//


import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isDarkMode = false

    var body: some View {
        VStack {
            // Navigation Bar
            HStack {
                Button(action: { presentationMode.wrappedValue.dismiss() }) {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                Spacer()
                Text("Settings")
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            
            // Settings List
            List {
                Section {
                    SettingRowView(icon: "bell", title: "Notification")
                    SettingRowView(icon: "lock", title: "Security")
                    SettingRowView(icon: "questionmark.circle", title: "Help")
                }

                // Dark Mode Toggle
                Toggle(isOn: $isDarkMode) {
                    HStack {
                        Image(systemName: "moon")
                        Text("Dark Mode")
                    }
                }
                .toggleStyle(SwitchToggleStyle(tint: .blue))

                // Logout Option
                Button(action: {
                    print("Logout tapped")
                }) {
                    HStack {
                        Image(systemName: "arrow.right.square")
                        Text("Logout")
                            .foregroundColor(.red)
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
        .navigationBarHidden(true)
    }
}

// Reusable Setting Row
struct SettingRowView: View {
    let icon: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(title)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
    }
}


#Preview {
    SettingsView()
}
