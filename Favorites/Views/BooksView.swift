//
//  BooksView.swift
//  Favorites
//
//  Created by Jonathan Braun on 5/29/26.
//
import SwiftUI

struct BooksView: View {
    
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    @Binding var searchText: String
    
    private var filteredBooks: [BookModel] {
        if searchText.isEmpty {
            return favoritesViewModel.books
        } else {
            return favoritesViewModel.books.filter {
                $0.bookTitle.localizedCaseInsensitiveContains(searchText)
                || $0.bookAuthor.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(filteredBooks) { book in
                    BookRowView(book: book)
                    
                    if book.id != filteredBooks.last?.id {
                        Divider()
                            .padding(.leading)
                    }
                }
            }
            .background(.background)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
            .padding(.bottom, 80)
        }
    }
}

#Preview {
    BooksView(searchText: .constant(""))
        .environmentObject(FavoritesViewModel())
}
