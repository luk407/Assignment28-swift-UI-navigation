//
//  ContentView.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 13.12.23.
//

import SwiftUI

struct MainScreen: View {
    
    //MARK: Properties
    @ObservedObject private var viewModel = MainScreenViewModel()
    
    @State private var path = NavigationPath()
    
    @State private var isTipShowed = false
    
    //MARK: Body
    var body: some View {
        VStack(spacing: 20) {
            NavigationStack(path: $path) {
                List {
                    ScrollView {
                        ForEach(viewModel.destinations) { destination in
                            NavigationLink(value: destination) {
                                DestinationCardView(cityName: destination.cityName, imageURL: URL(string: destination.mainImage)!, width: 300, height: 200)
                            }
                            .navigationDestination(for: Destination.self) { destination in
                                DestinationDetailScreen(destination: destination, path: $path)
                            }
                            .foregroundStyle(Color.black)
                        }
                    }
                }
                .navigationTitle("Traveling Destinations")
                .navigationBarTitleDisplayMode(.inline)
                .listStyle(.plain)
                
                Button {
                    isTipShowed = true
                } label: {
                    ButtonDesign(buttonText: "Show me a tip")
                }
                .alert(isPresented: $isTipShowed, content: {
                    Alert(title: Text("Traveling Tip"),
                          message: Text("\(viewModel.tips.randomElement()!)"),
                          primaryButton: .destructive(Text("OK")),
                          secondaryButton: .cancel())
                })
            }
            .task {
                viewModel.fetchDestinationData()
            }
        }
        .padding()
    }
}

#Preview {
    MainScreen()
}
