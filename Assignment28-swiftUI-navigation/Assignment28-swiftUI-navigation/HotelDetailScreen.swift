//
//  HotelDetailScreen.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 13.12.23.
//

import SwiftUI

struct HotelDetailScreen: View {
    
    @ObservedObject var destination: DestinationModel
    
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(spacing: 20, content: {
            destination.hotels.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            HStack {
                Text("Name: \(destination.hotels.name)")
                Spacer()
            }
            HStack {
                Text("Description: \(destination.hotels.description)")
                Spacer()
            }
            HStack {
                Text("Price: \(destination.hotels.price ?? "")")
                Spacer()
            }
            Spacer()
        })
        .navigationTitle("Hotel")
    }
}

//#Preview {
//    HotelDetailScreen()
//}
