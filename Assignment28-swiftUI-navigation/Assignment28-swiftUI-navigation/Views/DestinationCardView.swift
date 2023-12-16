//
//  DestinationCardView.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 16.12.23.
//

import SwiftUI

struct DestinationCardView: View {
    
    var cityName: String
    var imageURL: URL
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Rectangle()
                    .frame(width: geometry.size.width, height: 260)
                    .foregroundStyle(.gray.opacity(0.1))
                    .cornerRadius(10)
            }
            
            VStack(spacing: 10) {
                DownloadedImageView(imageURL: imageURL, width: width, height: height)
                
                Text("\(cityName)")
                    .bold()
                    .font(.system(size: 20))
                
                Spacer()
            }
            .padding()
        }
    }
}

//#Preview {
//    DestinationCardView()
//}
