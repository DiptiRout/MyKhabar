//
//  NewsListLargeCell.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 27/01/25.
//

import SwiftUI

struct NewsListLargeCell: View {
    let news: NewsEntityDTO

    var body: some View {
        // Trending Content
        VStack(alignment: .leading) {
            URLImageView(url: news.image)
                .scaledToFill()
                .frame(height: ScaledDesign.scaleHeight(183))
                .frame(maxWidth: .infinity)
                .cornerRadius(6)
            Text(news.author)
                .font(AppFonts.font(for: .text, size: .xSmall))
                .foregroundColor(AppColors.color(grayscale: .bodyText))
                .lineLimit(1)
            Text(news.title)
                .lineLimit(2)
                .font(AppFonts.font(for: .text, size: .medium))
                .foregroundColor(AppColors.systemPrimary)
            
            HStack {
                Image(systemName: "heart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                Text(news.source)
                    .font(AppFonts.font(for: .link, size: .xSmall))
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
            }
        }
        .padding()
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

    NewsListLargeCell(news: vm)
}
