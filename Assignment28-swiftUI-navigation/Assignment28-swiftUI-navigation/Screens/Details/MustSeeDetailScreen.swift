//
//  MustSeeDetailScreen.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 13.12.23.
//

import SwiftUI

struct MustSeeDetailScreen: View {
    
    //MARK: Properties
    var destination: Destination
    
    @Binding var path: NavigationPath
    
    //MARK: Body
    var body: some View {
        VStack(spacing: 20, content: {
            List {
                ScrollView {
                    DetailCardView(destination: destination, index: 0, detailName: "mustSee")
                    DetailCardView(destination: destination, index: 1, detailName: "mustSee")
                }
            }
            .listStyle(.plain)
            
            Spacer()
            
            Button(action: {
                path = NavigationPath()
            }, label: {
                ButtonDesign(buttonText: "Go back to Main Screen")
            })
        })
        .navigationTitle("Must See")
    }
}

//#Preview {
//    TransportDetailsScreen()
//}
