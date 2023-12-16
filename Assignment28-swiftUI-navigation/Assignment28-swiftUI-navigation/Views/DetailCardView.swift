//
//  DetailCardView.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 16.12.23.
//

import SwiftUI

struct DetailCardView: View {
    
    var destination: Destination
    
    var index: Int
    
    var detailName: String
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Rectangle()
                    .frame(width: geometry.size.width, height: 350)
                    .foregroundStyle(.gray.opacity(0.1))
                    .cornerRadius(10)
            }
            
            VStack(spacing: 10) {
                switch detailName { // აქაც ვიცი რომ კიდე უფრო ჯობდა enum-ები
                case "transport":
                    DownloadedImageView(imageURL: URL(string: destination.transport[index].image)!, width: 300, height: 200)
                    
                    HStack {
                        Text("Name: \(destination.transport[index].name)")
                        Spacer()
                    }
                    
                    HStack {
                        Text("Description: \(destination.transport[index].description)")
                        Spacer()
                    }
                    
                    HStack {
                        Text("Price: \(destination.transport[index].price ?? "")")
                        Spacer()
                    }
                case "mustSee":
                    DownloadedImageView(imageURL: URL(string: destination.mustSee[index].image)!, width: 300, height: 200)
                    
                    HStack {
                        Text("Name: \(destination.mustSee[index].name)")
                        Spacer()
                    }
                    
                    HStack {
                        Text("Description: \(destination.mustSee[index].description)")
                        Spacer()
                    }
                    
                    HStack {
                        Text("Price: \(destination.mustSee[index].price ?? "")")
                        Spacer()
                    }
                case "hotel":
                    DownloadedImageView(imageURL: URL(string: destination.hotels[index].image)!, width: 300, height: 200)
                    
                    HStack {
                        Text("Name: \(destination.hotels[index].name)")
                        Spacer()
                    }
                    
                    HStack {
                        Text("Description: \(destination.hotels[index].description)")
                        Spacer()
                    }
                    
                    HStack {
                        Text("Price: \(destination.hotels[index].price ?? "")")
                        Spacer()
                    }
                default:
                    Rectangle()
                }
            }
            .padding()
        }
    }
}

//#Preview {
//    DetailCardView()
//}
