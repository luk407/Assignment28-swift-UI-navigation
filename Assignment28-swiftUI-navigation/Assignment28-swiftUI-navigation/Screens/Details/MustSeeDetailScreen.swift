//
//  MustSeeDetailScreen.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 13.12.23.
//

import SwiftUI

struct MustSeeDetailScreen: View {
    
    @ObservedObject var destinationModel: DestinationModel
    
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(spacing: 20, content: {
            destinationModel.mustSee.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            HStack {
                Text("Name: \(destinationModel.mustSee.name)")
                Spacer()
            }
            HStack {
                Text("Description: \(destinationModel.mustSee.description)")
                Spacer()
            }
            HStack {
                Text("Price: \(destinationModel.mustSee.price ?? "")")
                Spacer()
            }
            Spacer()
            Button(action: {
                path = NavigationPath()
            }, label: {
                Text("Back to main screen")
            })
        })
        .navigationTitle("Must See")
    }
}

//#Preview {
//    MustSeeDetailScreen()
//}
