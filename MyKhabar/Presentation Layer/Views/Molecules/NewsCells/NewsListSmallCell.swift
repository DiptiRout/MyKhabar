//
//  NewsListSmallCell.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 27/01/25.
//

import SwiftUI


struct NewsListSmallCell: View {    
    let news: NewsEntityDTO
    
    var body: some View {
        HStack {
            URLImageView(url: news.image)
                .applyRoundedSquare(size: 96, cornerRadius: 6)
                .padding(.leading)

            VStack(alignment: .leading) {
                Text(news.author)
                    .font(AppFonts.font(for: .text, size: .xSmall))
                    .foregroundColor(AppColors.color(grayscale: .bodyText))
                    .lineLimit(1)
                    .padding(.trailing, 8)
                Text(news.title)
                    .font(AppFonts.font(for: .text, size: .medium))
                    .foregroundColor(AppColors.systemPrimary)
                    .lineLimit(2)
                    .padding(.trailing, 8)

                HStack {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    Text(news.source)
                        .font(AppFonts.font(for: .link, size: .xSmall)).fontWeight(.semibold)
                        .foregroundColor(AppColors.color(grayscale: .bodyText))
                        .lineLimit(1)
                        .padding(.trailing, 8)

                    Image(systemName: "clock")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14, height: 14)
                    Text(news.publishedAt.timeAgoSinceDate())
                        .font(AppFonts.font(for: .text, size: .xSmall))
                        .foregroundColor(AppColors.color(grayscale: .bodyText))
                        .lineLimit(1)
                    
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundStyle(AppColors.color(grayscale: .bodyText))
                            .padding(.trailing)
                    }
                    
                    
                }
            }
            Spacer()
            
            
        }
        .padding(.top)
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

    NewsListSmallCell(news: vm)
    NewsListSmallCell(news: vm)

}
