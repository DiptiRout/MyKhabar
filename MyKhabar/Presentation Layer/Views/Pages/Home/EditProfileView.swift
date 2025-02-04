//
//  EditProfileView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 01/02/25.
//

import SwiftUI

struct EditProfileView: View {
    @State private var username: String = "wilsonfranci"
    @State private var fullName: String = "Wilson Franci"
    @State private var email: String = "example@youremail.com"
    @State private var phoneNumber: String = "+62-8421-4512-2531"
    @State private var bio: String = "Lorem Ipsum is simply dummy text of the printing"
    @State private var website: String = "https://yourwebsite.com"

    var body: some View {
            VStack {
                // Profile Image Section
                ZStack {
                    Image("profile") // Replace with actual image loading logic
                        .resizable()
                        .scaledToFill()
                        .background(Color.red)
                        .frame(width: 140, height: 140)
                        .clipShape(Circle())

                    Button(action: {
                        // Handle image change action
                    }) {
                        Image(systemName: "camera.fill")
                            .padding(6)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                    .offset(x: 45, y: 45)
                }

                // Form Fields
                Form {
                    Section(header: Text("Username").font(.caption).foregroundColor(.gray)) {
                        TextField("Username", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }

                    Section(header: Text("Full Name").font(.caption).foregroundColor(.gray)) {
                        TextField("Full Name", text: $fullName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }

                    Section(header: Text("Email Address *").font(.caption).foregroundColor(.red)) {
                        TextField("Email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.emailAddress)
                    }

                    Section(header: Text("Phone Number *").font(.caption).foregroundColor(.red)) {
                        TextField("Phone", text: $phoneNumber)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.phonePad)
                    }

                    Section(header: Text("Bio").font(.caption).foregroundColor(.gray)) {
                        TextField("Bio", text: $bio)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }

                    Section(header: Text("Website").font(.caption).foregroundColor(.gray)) {
                        TextField("Website", text: $website)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.URL)
                    }
                }
            }
    }
}

#Preview {
    EditProfileView()
}
