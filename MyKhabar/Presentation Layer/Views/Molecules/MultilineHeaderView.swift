//
//  MultilineHeaderView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 23/01/25.
//


import SwiftUI


struct MultilineHeaderView: View {
    
    let uiModel: MultilineHeaderUIModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            ForEach(uiModel.headers.indices, id: \.self) { index in
                
                if !uiModel.headers[index].text.isEmpty {
                    
                    Text(uiModel.headers[index].text)
                        .font(uiModel.headers[index].font)
                        .foregroundStyle(uiModel.headers[index].textColor)
                        .lineLimit(uiModel.headers[index].lineLimit)
                }
            }
        }
        .frame(maxWidth: uiModel.maxWidth, alignment: .leading)
        .padding()
        
    }
}


#Preview {
    let headerUIModel = MultilineHeaderUIModel(
        headers: [("Hello", AppFonts.font(for: .display, size: .large), AppColors.systemPrimary, 1),
                  ("Again!", AppFonts.font(for: .display, size: .large), AppColors.appPrimary, 1),
                  ("Welcome back you've been missed", AppFonts.font(for: .text, size: .large), AppColors.color(grayscale: .bodyText), 2)
                 ],
        maxWidth: ScaledDesign.scaleWidth(UIScreen.main.bounds.width / 1.5))
    MultilineHeaderView(uiModel: headerUIModel)
}
