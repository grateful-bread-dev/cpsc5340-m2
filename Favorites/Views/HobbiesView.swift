//
//  HobbiesView.swift
//  Favorites
//
//  Created by Jonathan Braun on 5/29/26.
//
import SwiftUI

struct HobbiesView: View {
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(favoritesViewModel.hobbies) { hobby in
                    HobbyRowView(hobby: hobby)
                    
                    if hobby.id != favoritesViewModel.hobbies.last?.id {
                        Divider()
                            .padding(.leading, 64)
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
    HobbiesView()
        .environmentObject(FavoritesViewModel())
}
