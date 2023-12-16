//
//  MainScreenViewModel.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 13.12.23.
//

import GenericNetworkLayer
import SwiftUI

@Observable
final class MainScreenViewModel: ObservableObject {

    //MARK: Properties
    private var url = URL(string: "https://mocki.io/v1/2dc41f38-aba2-4b71-bf41-1a8f87f817de")!
    
    var destinations: [Destination] = []
    
    var downloadedImage: UIImage?
    
    //MARK: Tips Dummy
    var tips = [ // ამის შესახებ სულ დამავიწყდა (ამ გვერდის ბოლოში მქონდა და მაგიტო), თორე ამასაც API-ში გავიტანდი :დდდ
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
    
    //MARK: Methods
    func fetchDestinationData() {
        NetworkManager().request(with: url) { (result: Result<DestinationModel, Error>) in
            switch result {
            case .success(let data):
                self.destinations = data.destinations
            case .failure(let error):
                break
            }
        }
    }
    
    func downloadImage(urlString: String) -> UIImage {
        NetworkManager().downloadImage(from: urlString) { image in
            DispatchQueue.main.async {
                self.downloadedImage = image!
            }
        }
        return downloadedImage ?? UIImage(systemName: "circle")!
    }
}
