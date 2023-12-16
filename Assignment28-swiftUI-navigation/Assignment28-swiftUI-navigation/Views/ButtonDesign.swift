//
//  CustomButton.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 16.12.23.
//

import SwiftUI

struct ButtonDesign: View {
    
    var buttonText: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 200, height: 50)
                .foregroundStyle(.blue.opacity(0.1))
                .cornerRadius(10)
            
            HStack(spacing: 10) {
                switch buttonText {
                case "Transport": // ვიცი რომ enum-ად ჯობდა
                    Image(systemName: "car")
                case "Must See":
                    Image(systemName: "eyes.inverse")
                case "Hotel":
                    Image(systemName: "building")
                default:
                    Image(systemName: "")
                }
                
                Text("\(buttonText)")
            }
            .foregroundStyle(.black)
        }
    }
}

//#Preview {
//    CustomButton()
//}
