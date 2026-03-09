//
//  HomeSkeletonView.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 2/22/26.
//

import SwiftUI

struct HomeSkeletonView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            // Logo placeholder
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 200, height: 40)
                .frame(maxWidth: .infinity, alignment: .center)
            
            // Search bar placeholder
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.3))
                .frame(height: 45)
                .padding(.horizontal)
            
            // Horizontal list skeleton
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 17) {
                    ForEach(0..<4, id: \.self) { _ in
                        CartoonThumbnailSkeleton()
                    }
                }
                .padding(.leading, 15)
            }
            
            // Vertical list skeleton
            VStack(spacing: 16) {
                ForEach(0..<4, id: \.self) { _ in
                    VerticalCartoonSkeleton()
                }
            }
            .padding(.horizontal, 16)
        }
        .padding(.top, 20)
    }
}

