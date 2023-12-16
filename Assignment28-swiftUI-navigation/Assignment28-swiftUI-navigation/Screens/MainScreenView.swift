//
//  ContentView.swift
//  Assignment28-swiftUI-navigation
//
//  Created by Luka Gazdeliani on 13.12.23.
//

import SwiftUI

struct MainScreenView: View {
    
    @ObservedObject private var mainScreenViewModel = MainScreenViewModel()
    
    @State var path = NavigationPath()
    
    @State var isTipShowed = false
    
    var body: some View {
        VStack(spacing: 20) {
            NavigationStack(path: $path) {
                List {
                    ScrollView {
                        ForEach(mainScreenViewModel.destinations) { destination in
                            NavigationLink(value: destination) {
                                HStack(spacing: 30) {
                                    destination.mainImage
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(10)
                                    Text("\(destination.cityName)")
                                        .bold()
                                        .font(.system(size: 30))
                                    Spacer()
                                }
                            }
                            .navigationDestination(for: DestinationModel.self) { destination in
                                DestinationDetailScreen(destinationModel: destination, path: $path)
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
                          message: Text("\(mainScreenViewModel.tips.randomElement()!)"),
                          primaryButton: .destructive(Text("OK")),
                          secondaryButton: .cancel())
                })
            }
        }
        .padding()
    }
}

#Preview {
    MainScreenView()
}
