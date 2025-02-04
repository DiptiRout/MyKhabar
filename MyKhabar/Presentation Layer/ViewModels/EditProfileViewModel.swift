//
//  EditProfileViewModel.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 01/02/25.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    @Published var username: String = "wilsonfranci"
    @Published var fullName: String = "Wilson Franci"
    @Published var email: String = "example@youremail.com"
    @Published var phoneNumber: String = "+62-8421-4512-2531"
    @Published var bio: String = "Lorem Ipsum is simply dummy text of the printing"
    @Published var website: String = "https://yourwebsite.com"
    @Published var profileImage: UIImage?
    @Published var showImagePicker: Bool = false
    
    func saveProfile() {
        // Handle save logic (e.g., API call, local storage)
        print("Profile Saved: \(username), \(fullName), \(email)")
    }
    
    func validateFields() -> Bool {
        return !username.isEmpty && !fullName.isEmpty && email.contains("@") && phoneNumber.count >= 10
    }
    
    func updateProfileImage(_ image: UIImage) {
        profileImage = image
    }
}
