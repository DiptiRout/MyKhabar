//
//  NetworkAwareView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 31/01/25.
//

import SwiftUI

struct NetworkAwareView<Content: View>: View {
    @EnvironmentObject var networkMonitor: NetworkMonitor
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        Group {
            if networkMonitor.isConnected {
                content  // Show main content when connected
            } else {
                OfflineView()  // Show offline view when disconnected
            }
        }
        .onChange(of: networkMonitor.isConnected) { newStatus in
            // Optionally perform an action when the network status changes
            print("Network status changed: \(newStatus ? "Connected" : "Disconnected")")
        }
    }
}
