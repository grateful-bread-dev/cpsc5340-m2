//
//  HobbiesView.swift
//  Favorites
//
//  Created by Jonathan Braun on 5/29/26.
//
import SwiftUI

struct HobbiesView: View {
    
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    @Binding var searchText: String
    
    private var filteredHobbies: [HobbyModel] {
        if searchText.isEmpty {
            return favoritesViewModel.hobbies
        } else {
            return favoritesViewModel.hobbies.filter {
                $0.hobbyName.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(filteredHobbies) { hobby in
                    HobbyRowView(hobby: hobby)
                    
                    if hobby.id != filteredHobbies.last?.id {
                        Divider()
                            .padding(.leading, 64)
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
    HobbiesView(searchText: .constant(""))
        .environmentObject(FavoritesViewModel())
}
