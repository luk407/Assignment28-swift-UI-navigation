//
//  DestinationDetailScreen.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 13.12.23.
//

import SwiftUI

struct DestinationDetailScreen: View {
    
    var destination: Destination
    
    @Binding var path: NavigationPath
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Rectangle()
                    .frame(width: geometry.size.width, height: 340)
                    .foregroundStyle(.gray.opacity(0.1))
                    .cornerRadius(10)
            }
            
            VStack(spacing: 20) {
                DownloadedImageView(imageURL: URL(string: destination.mainImage)!, width: 300, height: 200)
                
                HStack(spacing: 20, content: {
                    DownloadedImageView(imageURL: URL(string: destination.images[0])!, width: 100, height: 100)
                    DownloadedImageView(imageURL: URL(string: destination.images[1])!, width: 100, height: 100)
                    DownloadedImageView(imageURL: URL(string: destination.images[2])!, width: 100, height: 100)
                })
                
                Spacer()
                
                VStack(spacing: 50, content: {
                    NavigationLink(destination: TransportDetailsScreen(destination: destination, path: $path)) {
                        ButtonDesign(buttonText: "Transport")
                    }
                    NavigationLink(destination: MustSeeDetailScreen(destination: destination, path: $path)) {
                        ButtonDesign(buttonText: "Must See")
                    }
                    NavigationLink(destination: HotelDetailScreen(destination: destination, path: $path)) {
                        ButtonDesign(buttonText: "Hotel")
                    }
                })
                
                Spacer()
            }
        }
        .navigationTitle(destination.cityName)
    }
}

//#Preview {
//    DestinationDetailScreen()
//}
