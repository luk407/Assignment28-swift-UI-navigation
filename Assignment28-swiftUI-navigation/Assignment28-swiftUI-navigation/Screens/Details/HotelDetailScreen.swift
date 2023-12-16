//
//  HotelDetailScreen.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 13.12.23.
//

import SwiftUI

struct HotelDetailScreen: View {
    
    @ObservedObject var destinationModel: DestinationModel
    
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(spacing: 20, content: {
            destinationModel.hotels.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            HStack {
                Text("Name: \(destinationModel.hotels.name)")
                Spacer()
            }
            HStack {
                Text("Description: \(destinationModel.hotels.description)")
                Spacer()
            }
            HStack {
                Text("Price: \(destinationModel.hotels.price ?? "")")
                Spacer()
            }
            Spacer()
            Button(action: {
                path = NavigationPath()
            }, label: {
                Text("Back to main screen")
            })
        })
        .navigationTitle("Hotel")
    }
}

//#Preview {
//    HotelDetailScreen()
//}
