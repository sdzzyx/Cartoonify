//
//  FavoriteCard.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 2/3/26.
//

import SwiftUI

struct FavoriteCard: View {
    let cartoon: Cartoon

    var body: some View {
        HStack(spacing: 16) {

            AsyncImage(url: URL(string: cartoon.imageUrl)) { phase in
                if case .success(let image) = phase {
                    image.resizable().scaledToFill()
                } else {
                    Color.gray.opacity(0.2)
                }
            }
            .frame(width: 90, height: 70)
            .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 6) {
                Text(cartoon.title)
                    .font(.headline)

                Text(cartoon.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }

            Spacer()

            Image("heart.fill@24")
        }
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

