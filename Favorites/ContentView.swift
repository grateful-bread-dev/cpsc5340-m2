//
// ContentView.swift : Favorites
//
// Copyright © 2025 Auburn University.
// All Rights Reserved.


import SwiftUI

struct ContentView: View {
    @StateObject private var favoritesViewModel = FavoritesViewModel()
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
        .environmentObject(favoritesViewModel)
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    ContentView()
}
