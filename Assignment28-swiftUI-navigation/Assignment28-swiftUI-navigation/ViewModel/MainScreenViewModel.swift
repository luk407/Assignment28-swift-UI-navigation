//
//  MainScreenViewModel.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 13.12.23.
//

import GenericNetworkLayer
import SwiftUI

final class MainScreenViewModel: ObservableObject {
    
    @Published var destinations = [
        DestinationModel(cityName: "Tbilisi",
                         description: "Tbilisi is the capital of Georgia, known for its diverse architecture, vibrant arts scene, and rich history.",
                         mainImage: Image(.tbilisi),
                         generalImages: [Image(.tbilisi1), Image(.tbilisi2), Image(.tbilisi3)],
                         transport: DetailedInfo(image: Image(.tbilisiMetro),
                                                 name: "Metro System",
                                                 description: "Efficient metro system for convenient city travel",
                                                 price: "$2 per trip"),
                         mustSee: DetailedInfo(image: Image(.tbilisiNarikala),
                                               name: "Narikala Fortress",
                                               description: "Ancient fortress offering panoramic views of the city",
                                               price: nil),
                         hotels: DetailedInfo(image: Image(.tbilisiHotel),
                                              name: "Boutique Hotel",
                                              description: "Elegant boutique hotel for a luxurious stay",
                                              price: nil)),
        DestinationModel(cityName: "Berlin",
                         description: "Berlin, the capital of Germany, is known for its rich history, cultural diversity, and vibrant arts scene.",
                         mainImage: Image(.tbilisi),
                         generalImages: [Image(.tbilisi1), Image(.tbilisi2), Image(.tbilisi3)],
                         transport: DetailedInfo(image: Image(.tbilisiMetro),
                                                 name: "U-Bahn and S-Bahn",
                                                 description: "Extensive metro and suburban train network for efficient city travel.",
                                                 price: "$3 per trip"),
                         mustSee: DetailedInfo(image: Image(.tbilisiNarikala),
                                               name: "Brandenburg Gate",
                                               description: "Iconic neoclassical gate symbolizing German unity.",
                                               price: nil),
                         hotels: DetailedInfo(image: Image(.tbilisiHotel),
                                              name: "Luxury Hotel",
                                              description: "Opulent hotel offering top-notch amenities and services.",
                                              price: nil)),
        DestinationModel(cityName: "Paris",
                         description: "Paris, the City of Lights, is renowned for its romantic ambiance, iconic landmarks, and world-class cuisine.",
                         mainImage: Image(.tbilisi),
                         generalImages: [Image(.tbilisi1), Image(.tbilisi2), Image(.tbilisi3)],
                         transport: DetailedInfo(image: Image(.tbilisiMetro),
                                                 name: "Paris Metro",
                                                 description: "Efficient metro system for navigating the city's attractions.",
                                                 price: "$2.50 per trip"),
                         mustSee: DetailedInfo(image: Image(.tbilisiNarikala),
                                               name: "Eiffel Tower",
                                               description: "Iconic iron tower offering breathtaking views of Paris.",
                                               price: nil),
                         hotels: DetailedInfo(image: Image(.tbilisiHotel),
                                              name: "Luxury Palace Hotel",
                                              description: "Indulge in luxury at a palace-style hotel with exquisite amenities.",
                                              price: nil)),
    ]
    
    @Published var tips = [
        "Use a small backpack/suitcase",
        "Take an extra bank card and credit card with you",
        "Don’t fly direct",
        "Travel by yourself at least once",
        "Don’t buy a money belt — they’re stupid",
        "Make extra copies of your passport and important documents",
        "Learn basic phrases in the native language of your destination",
        "Carry a basic first-aid kit",
        "Always carry a power bank",
    ]
}
