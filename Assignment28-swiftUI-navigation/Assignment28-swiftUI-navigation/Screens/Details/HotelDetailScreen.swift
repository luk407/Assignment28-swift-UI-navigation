//
//  HotelDetailScreen.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 13.12.23.
//

import SwiftUI

struct HotelDetailScreen: View {
    
    var destination: Destination
    
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(spacing: 20, content: {
            List {
                ScrollView {
                    DetailCardView(destination: destination, index: 0, detailName: "hotel")
                    DetailCardView(destination: destination, index: 1, detailName: "hotel")
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
        .navigationTitle("Hotel")
    }
}

//#Preview {
//    HotelDetailScreen()
//}
