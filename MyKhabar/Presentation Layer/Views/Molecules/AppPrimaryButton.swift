//
//  AppPrimaryButton.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 24/01/25.
//

import SwiftUI

struct AppPrimaryButton: View {
    
    enum AppPrimaryButtonType {
        case filled
        case outlined
    }
    
    var buttonType: AppPrimaryButtonType = .filled
    let uiModel: AppPrimaryButtonUIModel
    var title: String?
    var isDisabled: Bool = false
    let buttonPressed: () -> Void
    
    var body: some View {
        Button(action: buttonPressed) {
            HStack {
                if let image = uiModel.rightImage {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: uiModel.rightImageSize.width,
                               height: uiModel.rightImageSize.height)
                        .foregroundColor(uiModel.foregroundColor)
                }
                    
                if let text = title {
                    Text(text)
                        .font(uiModel.titleFont)
                        .foregroundColor(uiModel.foregroundColor)
                        .if (uiModel.rightImage != nil) {
                            $0.padding(.leading, 5)
                        }
                }
            }
            .padding()
            .frame(maxWidth: uiModel.buttonWidth)
            .frame(height: uiModel.buttonHeight)
            .if(buttonType == .filled) {
                $0
                .background(!isDisabled ? uiModel.backgroundColor : .gray.opacity(0.6))
                .cornerRadius(uiModel.cornerRadius)
            }
        }
        .disabled(isDisabled)
        .if(buttonType == .outlined) {
            $0
            .buttonStyle(OutlinedButtonStyle(
                borderColor: uiModel.backgroundColor,
                cornerRadius: 6,
                borderWidth: 1
            ))
        }
    }
}

#Preview {
    HStack {
        AppPrimaryButton(uiModel: AppPrimaryButtonUIModel(), title: "Login") {
            
        }
        AppPrimaryButton(uiModel:
                            AppPrimaryButtonUIModel(rightImage:
                                                        Image(systemName: "apple.logo"),
                                                    buttonWidth: nil)) {
        }
        
    }
    .padding()
}
