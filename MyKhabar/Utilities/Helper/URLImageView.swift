//
//  URLImageView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 30/01/25.
//

//import SwiftUI
//
//struct URLImageView: View {
//    let url: String
//
//    @State private var image: UIImage? = nil
//
//    var body: some View {
//        Group {
//            if let image = image {
//                Image(uiImage: image)
//                    .resizable()
//            } else {
//                Color.gray.modifier(ShimmerEffect())
//            }
//        }
//        .onAppear { loadImage() }
//    }
//
//    private func loadImage() {
//        guard let url = URL(string: url) else { return }
//
//        // Check cache first
//        if let cachedImage = ImageCache.shared.get(forKey: url.absoluteString) {
//            image = cachedImage
//            return
//        }
//
//        // Fetch from network
//        DispatchQueue.global().async {
//            if let data = try? Data(contentsOf: url),
//               let fetchedImage = UIImage(data: data) {
//                DispatchQueue.main.async {
//                    self.image = fetchedImage
//                    ImageCache.shared.set(fetchedImage, forKey: url.absoluteString)
//                }
//            }
//        }
//    }
//}
//
//class ImageCache {
//    @MainActor static let shared = ImageCache()
//    private let cache = NSCache<NSString, UIImage>()
//
//    func get(forKey key: String) -> UIImage? {
//        return cache.object(forKey: key as NSString)
//    }
//
//    func set(_ image: UIImage, forKey key: String) {
//        cache.setObject(image, forKey: key as NSString)
//    }
//}


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

    @State private var image: Image? = nil
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
