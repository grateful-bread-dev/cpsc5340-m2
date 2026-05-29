//
//  HobbyRowView.swift
//  Favorites
//
//  Created by Jonathan Braun on 5/29/26.
//
import SwiftUI

struct HobbyRowView: View {
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    let hobby: HobbyModel
    
    var body: some View {
        HStack {
            Image(systemName: hobby.hobbyIcon)
                .font(.title2)
                .frame(width: 36)
            
            Text(hobby.hobbyName)
                .font(.title3)
            
            Spacer()
            
            Button {
                favoritesViewModel.toggleFavoriteHobby(hobby: hobby)
            } label: {
                Image(systemName: hobby.isFavorite ? "heart.fill" : "heart")
                    .font(.title2)
            }
            .buttonStyle(.plain)
        }
        .padding()
    }
}

#Preview {
    HobbyRowView(hobby: HobbyModel(id: 1, hobbyName: "Painting", hobbyIcon: "paintbrush", isFavorite: false))
        .environmentObject(FavoritesViewModel())
}
