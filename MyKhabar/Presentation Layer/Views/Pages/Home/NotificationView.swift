//
//  NotificationView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 27/01/25.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, pinnedViews: .sectionHeaders) {
                Section {
                    ForEach(0...3, id: \.self) { index in
                        NewsNotificationCell()
                    }
                } header: {
                    Text("Today, April 22")
                        .font(AppFonts.font(for: .link, size: .medium))
                        .padding(.leading)

                }
            }
        }
    }
}

#Preview {
    NotificationView()
}
