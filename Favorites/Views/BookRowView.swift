//
//  BookRowView.swift
//  Favorites
//
//  Created by Jonathan Braun on 5/29/26.
//
import SwiftUI

struct BookRowView: View {
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    let book: BookModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
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
                    .font(.title2)
            }
            .buttonStyle(.plain)
        }
        .padding()
    }
}

#Preview {
    BookRowView(book: BookModel(id: 1, bookTitle: "1984", bookAuthor: "George Orwell", isFavorite: false))
        .environmentObject(FavoritesViewModel())
}
