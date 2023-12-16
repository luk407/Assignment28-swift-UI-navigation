//
//  DestinationModel.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 13.12.23.
//

import Foundation
import SwiftUI

struct DestinationModel: Decodable {
    let destinations: [Destination]
}

struct Destination: Decodable, Identifiable, Hashable {
    let id: Int
    let cityName: String
    let country: String
    let mainImage: String
    let description: String
    let images: [String]
    let transport, mustSee, hotels: [DetailedInfo]
}

struct DetailedInfo: Decodable, Hashable {
    let image: String
    let name: String
    let description: String
    let price: String?
}
