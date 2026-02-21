//
//  FavoriteView.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/29/26.
//

import SwiftUI

struct FavoriteView: View {
    
    @EnvironmentObject var favoritesStore: FavoritesStore
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text(AppConstant.FavoriteScreen.myFavoritesText)
                    .font(.largeTitle)
                
                ForEach($favoritesStore.favorites) { $cartoon in
                    VerticalCartoonCard(cartoon: $cartoon)
                }
            }
            .coordinateSpace(name: "scroll")
            .padding()
        }
    }
}
