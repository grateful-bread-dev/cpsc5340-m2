//
//  HomeView.swift
//  Favorites
//
//  Created by Jonathan Braun on 5/26/26.
//
import SwiftUI

enum FavoriteCategory: String, CaseIterable, Identifiable {
    case cities = "Cities"
    case hobbies = "Hobbies"
    case books = "Books"
    
    var id: String {
        rawValue
    }
}

struct HomeView: View {
    @State private var selectedCategory: FavoriteCategory = .cities
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Category", selection: $selectedCategory) {
                    ForEach(FavoriteCategory.allCases) { category in
                        Text(category.rawValue)
                            .tag(category)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .padding(.top)
                
                switch selectedCategory {
                case .cities:
                    CitiesView()
                case .hobbies:
                    HobbiesView()
                case .books:
                    BooksView()
                }
            }
            .navigationTitle("Browse")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(FavoritesViewModel())
}
