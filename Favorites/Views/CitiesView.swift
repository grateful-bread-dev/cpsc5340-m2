//
//  CitiesView.swift
//  Favorites
//
//  Created by Jonathan Braun on 5/29/26.
//
import SwiftUI

struct CitiesView: View {
    
    @EnvironmentObject var favorites: FavoritesViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(favorites.cities) { city in
                    CityCardView(city: city)
                }
            }
            .padding()
        }
    }
}

#Preview {
    CitiesView()
        .environmentObject(FavoritesViewModel())
}
