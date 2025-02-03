//
//  HomePageHeaderView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 31/01/25.
//

import SwiftUI

struct HomePageHeaderView: View {
    
    let notificationTap: () -> Void
    
    var body: some View {
        HStack {
            Image("Vector")
                .resizable()
                .scaledToFit()
                .frame(width: ScaledDesign.scaleWidth(99),
                       height: ScaledDesign.scaleHeight(33))
            Spacer()
            Image(systemName: "bell")
                .resizable()
                .scaledToFit()
                .frame(width: ScaledDesign.scaleWidth(32),
                       height: ScaledDesign.scaleHeight(32))
                .shadow(radius: 5)
                .onTapGesture {
                    notificationTap()
                }
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}
