//
//  ContentView.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 13.12.23.
//

import SwiftUI

struct MainScreen: View {
    
    @ObservedObject private var viewModel = MainScreenViewModel()
    
    @State private var path = NavigationPath()
    
    @State private var isTipShowed = false
    
    var body: some View {
        VStack(spacing: 20) {
            NavigationStack(path: $path) {
                List {
                    ScrollView {
                        ForEach(viewModel.destinations) { destination in
                            NavigationLink(value: destination) {
                                VStack(spacing: 0) {
                                    viewModel.setImage(imageURL: URL(string: destination.mainImage)!, width: 300, height: 200)
                                    Text("\(destination.cityName)")
                                        .bold()
                                        .font(.system(size: 20))
                                    Spacer()
                                }
                            }
                            .navigationDestination(for: Destination.self) { destination in
                                DestinationDetailScreen(viewModel: viewModel, destination: destination, path: $path)
                            }
                            .foregroundStyle(Color.black)
                        }
                    }
                }
                .navigationTitle("Traveling Destinations")
                .navigationBarTitleDisplayMode(.inline)
                .listStyle(.plain)
                
                Button("Show me a tip") {
                    isTipShowed = true
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
