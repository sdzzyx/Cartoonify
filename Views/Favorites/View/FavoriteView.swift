//
//  FavoriteView.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/29/26.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Favorite")
                    .font(.largeTitle)
            }
            .coordinateSpace(name: "scroll")
            .padding()
        }
    }
}
