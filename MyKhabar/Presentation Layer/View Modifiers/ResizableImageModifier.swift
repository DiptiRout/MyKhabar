//
//  ResizableImageModifier.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 30/01/25.
//

import SwiftUI

struct ResizableImageView: View {
    let image: UIImage
    var frameWidth: CGFloat
    var frameHeight: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            let imageWidth = geometry.size.width
            let imageHeight = geometry.size.height
            
            let aspectRatio = image.size.width / image.size.height
            
            // Calculate the scaled width and height to fit the frame without clipping
            let scaleWidth = imageWidth
            let scaleHeight = scaleWidth / aspectRatio
            
            if scaleHeight > imageHeight {
                let scaleHeight = imageHeight
                let scaleWidth = scaleHeight * aspectRatio
                
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: scaleWidth, height: scaleHeight)
                    .clipped()
            } else {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: scaleWidth, height: scaleHeight)
            }
            
        }
        .frame(width: frameWidth, height: frameHeight) // User-defined frame size
    }
}
