//
//  TransportDetailsScreen.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 13.12.23.
//

import SwiftUI

struct TransportDetailsScreen: View {
    
    @ObservedObject var destinationModel: DestinationModel
    
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(spacing: 20, content: {
            destinationModel.transport.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            HStack {
                Text("Name: \(destinationModel.transport.name)")
                Spacer()
            }
            HStack {
                Text("Description: \(destinationModel.transport.description)")
                Spacer()
            }
            HStack {
                Text("Price: \(destinationModel.transport.price ?? "")")
                Spacer()
            }
            Spacer()
            Button(action: {
                path = NavigationPath()
            }, label: {
                Text("Back to main screen")
            })
        })
        .navigationTitle("Transport")
    }
}

//#Preview {
//    TransportDetailsScreen()
//}
