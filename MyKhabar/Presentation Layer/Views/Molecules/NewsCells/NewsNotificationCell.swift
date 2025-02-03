//
//  NewsNotificationCell.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 27/01/25.
//

import SwiftUI

struct NewsNotificationCell: View {
    
    private var textView: Text {
        Text("Omar Merditz").font(AppFonts.font(for: .link, size: .medium))
        + Text(" on News Article Title").font(AppFonts.font(for: .text, size: .medium))
        }
    
    var body: some View {
        HStack {
            Image("smallCell")
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                
                textView
                    .foregroundColor(AppColors.color(grayscale: .titleActive))
                    .lineLimit(2)
                
                Text("10m ago")
                    .font(AppFonts.font(for: .text, size: .xSmall))
                    .foregroundColor(AppColors.color(grayscale: .bodyText))
                    .lineLimit(1)
            }
            Spacer()
            
            AppPrimaryButton(buttonType: .outlined,
                             uiModel: AppPrimaryButtonUIModel(
                                rightImage: Image(systemName: "plus"),
                                foregroundColor: AppColors.appPrimary,
                                buttonHeight: ScaledDesign.scaleHeight(32),
                                buttonWidth: nil
                             ), title: "Follow") {
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2)
        .padding(.horizontal)
    }
}

#Preview {
    NewsNotificationCell()
}
