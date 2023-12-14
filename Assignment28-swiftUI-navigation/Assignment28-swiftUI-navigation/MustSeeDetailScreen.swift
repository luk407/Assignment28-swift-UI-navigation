//
//  MustSeeDetailScreen.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 13.12.23.
//

import SwiftUI

struct MustSeeDetailScreen: View {
    
    @ObservedObject var destination: DestinationModel
    
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(spacing: 20, content: {
            destination.mustSee.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            HStack {
                Text("Name: \(destination.mustSee.name)")
                Spacer()
            }
            HStack {
                Text("Description: \(destination.mustSee.description)")
                Spacer()
            }
            HStack {
                Text("Price: \(destination.mustSee.price ?? "")")
                Spacer()
            }
            Spacer()
        })
        .navigationTitle("Must See")
    }
}

//#Preview {
//    MustSeeDetailScreen()
//}
