//
//  CartoonThumbnail.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/26/26.
//

import SwiftUI

struct CartoonThumbnail: View {
    let cartoon: Cartoon
    
    var body: some View {
        AsyncImage(url: URL(string: cartoon.imageUrl)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                
            case .failure(_):
                placeholder
                
            case .empty:
                placeholder
                
            @unknown default:
                placeholder
            }
        }
        .frame(width: 200, height: 120) // rectangle shape
        .clipShape(
            RoundedRectangle(cornerRadius: 15, style: .continuous)
        )
    }
    
    private var placeholder: some View {
        RoundedRectangle(cornerRadius: 15, style: .continuous)
            .fill(Color.gray.opacity(0.2))
    }
}
