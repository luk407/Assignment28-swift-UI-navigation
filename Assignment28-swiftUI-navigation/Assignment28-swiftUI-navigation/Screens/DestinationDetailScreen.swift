//
//  DestinationDetailScreen.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 13.12.23.
//

import SwiftUI

struct DestinationDetailScreen: View {
    
    var destinationModel: DestinationModel
    
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(spacing: 10) {
            destinationModel.mainImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            HStack(spacing: 20, content: {
                destinationModel.generalImages[0]
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                destinationModel.generalImages[1]
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                destinationModel.generalImages[2]
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            })
            
            VStack(spacing: 20, content: {
                NavigationLink(destination: TransportDetailsScreen(destinationModel: destinationModel, path: $path)) {
                    Text("Transport")
                }
                NavigationLink(destination: MustSeeDetailScreen(destinationModel: destinationModel, path: $path)) {
                    Text("Must See")
                }
                NavigationLink(destination: HotelDetailScreen(destinationModel: destinationModel, path: $path)) {
                    Text("Hotel")
                }
            })
            
            
            Spacer()
        }
        .navigationTitle(destinationModel.cityName)
    }
}

//#Preview {
//    DestinationDetailScreen()
//}
