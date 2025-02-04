//
//  URLImageView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 30/01/25.
//

import SwiftUI

// Actor for caching SwiftUI Images
actor ImageCache {
    private var cache: [String: Image] = [:]

    static let shared = ImageCache()

    func get(forKey key: String) -> Image? {
        return cache[key]
    }

    func set(_ image: Image, forKey key: String) {
        cache[key] = image
    }
}

struct URLImageView: View {
    let url: String
    let fallbackImage = Image(systemName: "photo")  // SwiftUI Image as fallback

    @State private var image: Image?
    @State private var isLoading = true  // Controls shimmer visibility

    var body: some View {
        Group {
            if isLoading {
                Color.gray.modifier(ShimmerEffect())
            } else if let image = image {
                image.resizable()
            } else {
                fallbackImage.resizable()
            }
        }
        .onAppear { loadImage() }
    }

    private func loadImage() {
        Task {
            guard let url = URL(string: url) else {
                self.isLoading = false
                return
            }

            // Check cache first
            if let cachedImage = await ImageCache.shared.get(forKey: url.absoluteString) {
                self.image = cachedImage
                self.isLoading = false
                return
            }

            // Fetch from network
            do {
                let fetchedImage = try await fetchImage(from: url)
                self.image = fetchedImage
                await ImageCache.shared.set(fetchedImage, forKey: url.absoluteString)
            } catch {
                self.image = fallbackImage  // Use fallback if fetching fails
            }
            self.isLoading = false
        }
    }

    private func fetchImage(from url: URL) async throws -> Image {
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let uiImage = UIImage(data: data) else {
            throw URLError(.badServerResponse)
        }
        return Image(uiImage: uiImage)  // Convert to SwiftUI Image
    }
}
