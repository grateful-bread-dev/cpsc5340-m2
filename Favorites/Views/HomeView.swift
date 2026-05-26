//
//  HomeView.swift
//  Favorites
//
//  Created by Jonathan Braun on 5/26/26.
//
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel

    var body: some View {
        NavigationStack {
            List {
                Section("Cities") {
                    ForEach(favoritesViewModel.cities) { city in
                        HStack {
                            Text(city.cityName)

                            Spacer()

                            Button {
                                favoritesViewModel.toggleFavoriteCity(city: city)
                            } label: {
                                Image(systemName: city.isFavorite ? "heart.fill" : "heart")
                            }
                        }
                    }
                }

                Section("Hobbies") {
                    ForEach(favoritesViewModel.hobbies) { hobby in
                        HStack {
                            Image(systemName: hobby.hobbyIcon)
                            Text(hobby.hobbyName)

                            Spacer()

                            Button {
                                favoritesViewModel.toggleFavoriteHobby(hobby: hobby)
                            } label: {
                                Image(systemName: hobby.isFavorite ? "heart.fill" : "heart")
                            }
                        }
                    }
                }

                Section("Books") {
                    ForEach(favoritesViewModel.books) { book in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(book.bookTitle)
                                    .font(.headline)

                                Text(book.bookAuthor)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }

                            Spacer()

                            Button {
                                favoritesViewModel.toggleFavoriteBook(book: book)
                            } label: {
                                Image(systemName: book.isFavorite ? "heart.fill" : "heart")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(FavoritesViewModel())
}
