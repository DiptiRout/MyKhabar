//
//  AppSecondaryButton.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 25/01/25.
//

import SwiftUI

struct AppSecondaryButton: View {
    
    var isSelected: Bool
    let optionImage: String
    let checked: () -> Void

    var body: some View {
        
        Button {
            checked()
        } label: {
            HStack {
                ZStack {
                    Rectangle()
                        .fill(AppColors.appPrimary)
                        .frame(width: 64, height: 64)
                    
                    Image(systemName: optionImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color.white)
                }
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .padding(.trailing, 8)

                VStack(alignment: .leading) {
                    Text("via Email:")
                        .foregroundStyle(AppColors.color(grayscale: .buttonText))
                        .padding(.bottom, 4)
                    Text(verbatim: "example@email.com")
                        .foregroundStyle(AppColors.color(grayscale: .titleActive))
                }
                Spacer()
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .scaledToFit()
                    .font(AppFonts.font(for: .display, size: .medium))
                    .frame(width: 24, height: 24)
                    .foregroundStyle(isSelected ? AppColors.appPrimary : AppColors.color(grayscale: .buttonText))
            }
            .padding()
        }
        .buttonStyle(PlainButtonStyle())
        .frame(width: ScaledDesign.scaleWidth(390))
        .background(AppColors.color(grayscale: .secondaryButton))
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

#Preview {
    AppSecondaryButton(isSelected: false, optionImage: "heart") {
        
    }
}
