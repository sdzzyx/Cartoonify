//
//  CartoonThumbnail.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/26/26.
//

import SwiftUI
import Kingfisher

struct CartoonThumbnail: View {
    let cartoon: Cartoon
    
    var body: some View {
        KFImage(URL(string: cartoon.imageUrl))
            .loadDiskFileSynchronously()
            .resizable()
            .placeholder {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.gray.opacity(0.2))
            }
            .fade(duration: 0.25)
            .cancelOnDisappear(true)
            .scaledToFill()
            .frame(width: 200, height: 120)
            .clipShape(
                RoundedRectangle(cornerRadius: 15, style: .continuous)
            )

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
