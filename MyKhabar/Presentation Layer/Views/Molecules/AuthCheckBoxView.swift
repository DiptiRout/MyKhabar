//
//  AuthCheckBoxView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 24/01/25.
//


import SwiftUI


struct AuthCheckBoxView: View {
    
    @State private var isChecked = false
    
    let uiModel: AuthCheckBoxUIModel

    var body: some View {
        HStack {
            Button(action: {
                isChecked.toggle()
            }) {
                HStack {
                    Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                        .foregroundColor(isChecked
                                         ? uiModel.checkedBoxColor
                                         : uiModel.uncheckedBoxColor)
                        .font(uiModel.checkBoxFont)
                    
                    Text(uiModel.lableText)
                        .font(uiModel.textFont)
                        .foregroundStyle(uiModel.textColor)
                }
            }
        }
    }
}


#Preview {
    AuthCheckBoxView(uiModel: AuthCheckBoxUIModel())
}
