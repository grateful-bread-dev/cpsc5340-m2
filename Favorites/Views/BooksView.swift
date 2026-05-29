//
//  BooksView.swift
//  Favorites
//
//  Created by Jonathan Braun on 5/29/26.
//
import SwiftUI

struct BooksView: View {
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(favoritesViewModel.books) { book in
                    BookRowView(book: book)
                    
                    if book.id != favoritesViewModel.books.last?.id {
                        Divider()
                            .padding(.leading)
                    }
                }
            }
            .background(.background)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
        }
    }
}

#Preview {
    BooksView()
        .environmentObject(FavoritesViewModel())
}
