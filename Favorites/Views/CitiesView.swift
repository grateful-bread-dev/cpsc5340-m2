//
//  CitiesView.swift
//  Favorites
//
//  Created by Jonathan Braun on 5/29/26.
//
import SwiftUI

struct CitiesView: View {
    
    @EnvironmentObject var favorites: FavoritesViewModel
    @Binding var searchText: String
    
    private var filteredCities: [CityModel] {
        if searchText.isEmpty {
            return favorites.cities
        } else {
            return favorites.cities.filter {
                $0.cityName.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(filteredCities) { city in
                    CityCardView(city: city)
                }
            }
            .padding()
            .padding(.bottom, 80)
        }
    }
}

#Preview {
    CitiesView(searchText: .constant(""))
        .environmentObject(FavoritesViewModel())
}
