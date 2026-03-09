//
//  VerticalCartoonSkeleton.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 2/22/26.
//

import SwiftUI

struct VerticalCartoonSkeleton: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 200)
            
            VStack(alignment: .leading, spacing: 8) {
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 18)
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 14)
            }
            .padding()
        }
        .cornerRadius(16)
        .redacted(reason: .placeholder)
        .shimmer()
    }
}
