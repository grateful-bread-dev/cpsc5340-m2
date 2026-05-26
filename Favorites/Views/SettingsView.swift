//
//  SettingsView.swift
//  Favorites
//
//  Created by Jonathan Braun on 5/26/26.
//
import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false

    var body: some View {
        NavigationStack {
            Form {
                Section("Appearance") {
                    Toggle("Dark Mode", isOn: $isDarkMode)
                }

                Section("Favorites") {
                    Button("Clear All Favorites", role: .destructive) {
                        favoritesViewModel.clearAllFavorites()
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(FavoritesViewModel())
}
