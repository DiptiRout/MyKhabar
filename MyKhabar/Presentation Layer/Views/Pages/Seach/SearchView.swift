import SwiftUI

struct SearchView: View {
    @State private var searchText = "" // Search query
    @State private var selectedTab = 0 // Tab selection
    @State private var tabFrames: [CGRect] = Array(repeating: .zero, count: 3) // Store each tab's frame
    private let segmentTitles = ["Home", "Search", "Profile"]
    
    var body: some View {
        VStack(spacing: 20) {
            // Search Bar
//            TextField("Search here...", text: $searchText)
//                .padding()
//                .background(Color(.systemGray6))
//                .cornerRadius(10)
//                .padding(.horizontal)
            
            CategoryTabBarView(currentTab: self.$selectedTab)
            
//            ZStack(alignment: .top) {
//                TabView(selection: $selectedTab) {
//                    Text("Home Tab")
//                        .tabItem {
//                            Label("Home", systemImage: "house")
//                        }
//                        .tag(0)
//                    
//                    Text("Search Tab")
//                        .tabItem {
//                            Label("Search", systemImage: "magnifyingglass")
//                        }
//                        .tag(1)
//                    
//                    Text("Profile Tab")
//                        .tabItem {
//                            Label("Profile", systemImage: "person")
//                        }
//                        .tag(2)
//                }
//                .tabViewStyle(.page(indexDisplayMode: .never))
//                .edgesIgnoringSafeArea(.all)
//                .background(.yellow)
//                
//            }
//            Spacer()
        }
        .padding(.vertical)
        .onAppear {
            // Ensure frames are calculated on first render
            DispatchQueue.main.async {
                selectedTab = 0
            }
        }
    }
}

#Preview {
    SearchView()
}
