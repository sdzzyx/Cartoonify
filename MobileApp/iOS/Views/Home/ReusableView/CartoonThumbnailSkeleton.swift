//
//  CartoonThumbnailSkeleton.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 2/22/26.
//

import SwiftUI

struct CartoonThumbnailSkeleton: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.gray.opacity(0.3))
            .frame(width: 200, height: 120)
            .shimmer()
    }
}

