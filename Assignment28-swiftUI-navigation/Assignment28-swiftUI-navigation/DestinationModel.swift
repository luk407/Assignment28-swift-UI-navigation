//
//  DestinationModel.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 13.12.23.
//

import Foundation
import SwiftUI

//struct DestinationModel: Codable, Identifiable {
//    var id: UUID?
//    let destinations: [Destination]
//}
//
//struct Destination: Codable, Identifiable {
//    var id: UUID?
//    let cityName, mainImage, description: String
//    let generalImages: [GeneralImage]
//    let transport, mustSee, hotels: [Hotel]
//}
//
//enum GeneralImage: String, Codable {
//    case image1 = "image1"
//    case image2 = "image2"
//    case image3 = "image3"
//}
//
//struct Hotel: Codable {
//    var id: UUID
//    let image, name, description: String
//    let price: String?
//}
 
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
