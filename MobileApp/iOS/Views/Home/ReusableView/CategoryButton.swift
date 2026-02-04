//
//  CategoryButton.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/27/26.
//

import SwiftUI

struct CategoryPillButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(isSelected ? .blue : .primary)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .stroke(
                            isSelected ? Color.blue : Color.gray.opacity(0.3),
                            lineWidth: 1.5
                        )
                )
        }
    }
}
