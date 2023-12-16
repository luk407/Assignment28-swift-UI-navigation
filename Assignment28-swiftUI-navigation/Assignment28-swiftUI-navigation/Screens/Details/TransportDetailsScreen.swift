//
//  TransportDetailsScreen.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 13.12.23.
//

import SwiftUI

struct TransportDetailsScreen: View {
    
    var viewModel: MainScreenViewModel
    
    var destination: Destination
    
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(spacing: 20, content: {
            viewModel.setImage(imageURL: URL(string: destination.transport[0].image)!, width: 300, height: 200)
            
            HStack {
                Text("Name: \(destination.transport[0].name)")
                Spacer()
            }
            
            HStack {
                Text("Description: \(destination.transport[0].description)")
                Spacer()
            }
            
            HStack {
                Text("Price: \(destination.transport[0].price ?? "")")
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
