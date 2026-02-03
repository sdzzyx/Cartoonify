//
//  CartoonCardView.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/28/26.
//
import SwiftUI

struct CartoonCardView: View {
    let cartoon: Cartoon

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            // Image
            AsyncImage(url: URL(string: cartoon.imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 180)
            .clipped()
            .cornerRadius(12)

            // Title
            Text(cartoon.title)
                .font(.headline)
                .fontWeight(.semibold)

            // Description
            Text(cartoon.description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .lineLimit(2)

        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 4)
    }
}
