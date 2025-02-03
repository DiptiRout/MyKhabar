//
//  NewsCategoryTopicCell.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 27/01/25.
//

import SwiftUI


struct NewsCategoryTopicCell: View {

    let news: NewsEntityDTO
    
    private var textView: Text {
        Text("Omar Merditz").font(AppFonts.font(for: .link, size: .medium))
        + Text(" on News Article Title").font(AppFonts.font(for: .text, size: .medium))
        }
    
    var body: some View {
        HStack {
            URLImageView(url: news.image)
                .applyRoundedSquare(size: 96, cornerRadius: 6)
            VStack(alignment: .leading) {
                
                Text(news.category)
                    .font(AppFonts.font(for: .text, size: .medium))
                    .foregroundStyle(AppColors.color(grayscale: .titleActive))
                Text(news.title)
                    .font(AppFonts.font(for: .text, size: .small))
                    .foregroundColor(AppColors.color(grayscale: .bodyText))
                    .lineLimit(3)
            }
            Spacer()
            
            AppPrimaryButton(buttonType: .outlined,
                             uiModel: AppPrimaryButtonUIModel(
                                foregroundColor: AppColors.appPrimary,
                                buttonHeight: ScaledDesign.scaleHeight(32),
                                buttonWidth: nil
                             ), title: "Save") {
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    let vm = NewsEntityDTO(id: UUID(),
                           author: "Testing news descriptions. Two line text showing in single frame.",
                           title: "Testing news descriptions. Two line statements. This is very long text.",
                           description: "Konoha",
                           url: "www.google.com",
                           source: "Ninja News",
                           image: "https://imagez.tmz.com/image/fa/4by3/2020/08/04/fad55ee236fc4033ba324e941bb8c8b7_md.jpg",
                           category: "Ninja",
                           publishedAt: "2025-01-29T07:23:05+00:00"
    )

    NewsCategoryTopicCell(news: vm)
    NewsCategoryTopicCell(news: vm)

}
