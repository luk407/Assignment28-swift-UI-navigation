//
//  DestinationModel.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 13.12.23.
//

import Foundation
import SwiftUI

@Observable
final class DestinationModel: Identifiable, ObservableObject, Hashable {
    static func == (lhs: DestinationModel, rhs: DestinationModel) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    let cityName, description: String
    let mainImage: Image
    let generalImages: [Image]
    let transport, mustSee, hotels: DetailedInfo
    
    init(cityName: String, description: String, mainImage: Image, generalImages: [Image], transport: DetailedInfo, mustSee: DetailedInfo, hotels: DetailedInfo) {
        self.cityName = cityName
        self.description = description
        self.mainImage = mainImage
        self.generalImages = generalImages
        self.transport = transport
        self.mustSee = mustSee
        self.hotels = hotels
    }    
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(ObjectIdentifier(self))
        }
}

struct DetailedInfo {
    let image: Image
    let name, description: String
    let price: String?
}
