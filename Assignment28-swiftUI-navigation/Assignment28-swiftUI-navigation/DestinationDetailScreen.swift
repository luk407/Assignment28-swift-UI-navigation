//
//  DestinationDetailScreen.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 13.12.23.
//

import SwiftUI

struct DestinationDetailScreen: View {
    
    @ObservedObject var destination: DestinationModel
    
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(spacing: 10) {
            destination.mainImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            HStack(spacing: 20, content: {
                destination.generalImages[0]
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                destination.generalImages[1]
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                destination.generalImages[2]
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            })
            
            VStack(spacing: 20, content: {
                NavigationLink {
                    TransportDetailsScreen(destination: destination, path: $path)
                } label: {
                    Text("Transport")
                }
                NavigationLink {
                    MustSeeDetailScreen(destination: destination, path: $path)
                } label: {
                    Text("Must See")
                }
                NavigationLink {
                    HotelDetailScreen(destination: destination, path: $path)
                } label: {
                    Text("Hotel")
                }
            })
            
            Spacer()
        }
        .navigationTitle(destination.cityName)
    }
}

//#Preview {
//    DestinationDetailScreen()
//}
