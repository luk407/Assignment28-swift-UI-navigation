//
//  ImageView.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 16.12.23.
//

import SwiftUI

struct DownloadedImageView: View {
    
    var imageURL: URL
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            AsyncImage(url: imageURL) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: width, height: height)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                case .failure:
                    Image(systemName: "photo")
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                @unknown default:
                    EmptyView()
                }
            }
        }
        .frame(width: width, height: height)
        .cornerRadius(10)
    }
}

//#Preview {
//    DownloadedImageView()
//}
