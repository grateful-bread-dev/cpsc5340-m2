//
//  FavoritesView.swift
//  Favorites
//
//  Created by Jonathan Braun on 5/26/26.
//
import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel

    var body: some View {
        NavigationStack {
            List {
                Section("Favorite Cities") {
                    if favoritesViewModel.favoriteCities.isEmpty {
                        Text("No favorite cities yet.")
                            .foregroundStyle(.secondary)
                    } else {
                        ForEach(favoritesViewModel.favoriteCities) { city in
                            HStack {
                                Text(city.cityName)

                                Spacer()

                                Button {
                                    favoritesViewModel.toggleFavoriteCity(city: city)
                                } label: {
                                    Image(systemName: "heart.fill")
                                }
                            }
                        }
                    }
                }

                Section("Favorite Hobbies") {
                    if favoritesViewModel.favoriteHobbies.isEmpty {
                        Text("No favorite hobbies yet.")
                            .foregroundStyle(.secondary)
                    } else {
                        ForEach(favoritesViewModel.favoriteHobbies) { hobby in
                            HStack {
                                Image(systemName: hobby.hobbyIcon)
                                Text(hobby.hobbyName)

                                Spacer()

                                Button {
                                    favoritesViewModel.toggleFavoriteHobby(hobby: hobby)
                                } label: {
                                    Image(systemName: "heart.fill")
                                }
                            }
                        }
                    }
                }

                Section("Favorite Books") {
                    if favoritesViewModel.favoriteBooks.isEmpty {
                        Text("No favorite books yet.")
                            .foregroundStyle(.secondary)
                    } else {
                        ForEach(favoritesViewModel.favoriteBooks) { book in
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
                                    Image(systemName: "heart.fill")
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

#Preview {
    FavoritesView()
        .environmentObject(FavoritesViewModel())
}
