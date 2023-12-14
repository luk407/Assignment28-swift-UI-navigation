//
//  TransportDetailsScreen.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 13.12.23.
//

import SwiftUI

struct TransportDetailsScreen: View {
    
    @ObservedObject var destination: DestinationModel
    
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 20, content: {
                destination.transport.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                HStack {
                    Text("Name: \(destination.transport.name)")
                    Spacer()
                }
                HStack {
                    Text("Description: \(destination.transport.description)")
                    Spacer()
                }
                HStack {
                    Text("Price: \(destination.transport.price ?? "")")
                    Spacer()
                }
                Spacer()
            })
            .navigationTitle("Transport")
        }
    }
}

//#Preview {
//    TransportDetailsScreen()
//}
