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

    private var url = URL(string: "https://mocki.io/v1/2dc41f38-aba2-4b71-bf41-1a8f87f817de")!
    
    var destinations: [Destination] = []
    
    var downloadedImage: UIImage?
    
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
    
    func setImage(imageURL: URL, width: CGFloat, height: CGFloat) -> some View {
        HStack {
            GeometryReader { geometry in
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: width, height: height)
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                    }
                }
            }
            .frame(width: width, height: height)
            .cornerRadius(10)
        }
    }
    
    var tips = [
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
