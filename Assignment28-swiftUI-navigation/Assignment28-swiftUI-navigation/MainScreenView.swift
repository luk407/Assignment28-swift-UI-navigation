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
            NavigationStack {
                List {
                    ScrollView {
                        ForEach(mainScreenViewModel.destinations) { destination in
                            NavigationLink {
                                DestinationDetailScreen(destination: destination, path: $path)
                            } label: {
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
