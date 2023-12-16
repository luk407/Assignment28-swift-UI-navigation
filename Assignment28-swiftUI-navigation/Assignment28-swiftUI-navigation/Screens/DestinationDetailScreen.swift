//
//  DestinationDetailScreen.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 13.12.23.
//

import SwiftUI

struct DestinationDetailScreen: View {
    
    var viewModel: MainScreenViewModel
    
    var destination: Destination
    
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(spacing: 10) {
            viewModel.setImage(imageURL: URL(string: destination.mainImage)!, width: 300, height: 200)
            
            HStack(spacing: 20, content: {
                viewModel.setImage(imageURL: URL(string: destination.images[0])!, width: 100, height: 100)
                viewModel.setImage(imageURL: URL(string: destination.images[1])!, width: 100, height: 100)
                viewModel.setImage(imageURL: URL(string: destination.images[2])!, width: 100, height: 100)
            })
            
            VStack(spacing: 20, content: {
                NavigationLink(destination: TransportDetailsScreen(viewModel: viewModel, destination: destination, path: $path)) {
                    Text("Transport")
                }
                NavigationLink(destination: MustSeeDetailScreen(viewModel: viewModel, destination: destination, path: $path)) {
                    Text("Must See")
                }
                NavigationLink(destination: HotelDetailScreen(viewModel: viewModel, destination: destination, path: $path)) {
                    Text("Hotel")
                }
            })
        
            Spacer()
        }
        .navigationTitle(destination.cityName)
    }
    
    private func setImage(imageURL: URL) -> some View {
        GeometryReader { proxy in
            AsyncImage(url: imageURL) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: proxy.size.width, height: 300)
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
                }
            }
        }
    }
}

//#Preview {
//    DestinationDetailScreen()
//}
