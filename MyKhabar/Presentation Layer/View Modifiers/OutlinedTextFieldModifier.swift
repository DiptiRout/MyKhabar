//
//  OutlinedTextFieldModifier.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 27/01/25.
//

import SwiftUI

struct OutlinedTextFieldModifier: ViewModifier {
    
    enum TextFieldType {
        case textField
        case searchTextField
    }
    
    let textFieldType: TextFieldType
    let uiModel: OutlinedTextFieldUIModel

    func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            if textFieldType == .textField && uiModel.headerText != "" {
                /// Header View
                Text(createHeaderText())
                    .font(uiModel.textFont)
                    .foregroundStyle(uiModel.headerTextColor)
            }
            
            HStack() {
                if uiModel.leftViewImage != "" {
                    Image(systemName: uiModel.leftViewImage)
                        .padding(.leading, 8)
                }
                content
                    .font(uiModel.textFont)
                    .foregroundStyle(uiModel.textColor)
                    .frame(minHeight: 48)
                    .frame(height: uiModel.height)
                    .padding(.leading, 6)
                    .ignoresSafeArea()
                
                if uiModel.rightViewImage != "" {
                    Image(systemName: uiModel.rightViewImage)
                        .padding(.trailing, 8)
                }
            }
            .background(backgroundColorAsPerError())
            .overlay(
                RoundedRectangle(cornerRadius: uiModel.cornerRadius)
                    .stroke(textColorAsPerError(), lineWidth: uiModel.lineWidth)
            )
            
            if textFieldType == .textField {
                /// Footer View
                HStack {
                    if uiModel.footerViewImage != "" {
                        Image(systemName: uiModel.footerViewImage)
                    }
                    if uiModel.footerText != "" {
                        Text(uiModel.footerText)
                            .font(uiModel.textFont)
                    }
                }
                .foregroundStyle(uiModel.footerTextColor)
            }
        }
        .padding(.leading)
        .padding(.trailing)
    }
    
    private func backgroundColorAsPerError() -> Color {
        uiModel.footerText.isEmpty ?
        .clear
        : uiModel.backgroundColor.opacity(0.3)
    }
    
    private func textColorAsPerError() -> Color {
        uiModel.footerText.isEmpty ?
        .gray
        : uiModel.footerTextColor
    }
    
    private func attributedString(text: String) -> AttributedString {
        var attributedString = AttributedString(text)
        if let range = Range(NSRange(location: text.count - 1, length: 1), in: text) {
            let attributedStringRange = Range(range, in: attributedString)!
            attributedString[attributedStringRange].foregroundColor = .red
        }
        return attributedString
    }
    
    private func createHeaderText() -> AttributedString {
        return uiModel.isMandatory
        ? attributedString(text: uiModel.headerText + "*")
        : AttributedString(uiModel.headerText)        
    }
}

extension View {
    
    func applyOutlinedStyle(textFieldType: OutlinedTextFieldModifier.TextFieldType, uiModel: OutlinedTextFieldUIModel) -> some View {
        self.modifier(OutlinedTextFieldModifier(textFieldType: textFieldType, uiModel: uiModel))
    }
    
}
