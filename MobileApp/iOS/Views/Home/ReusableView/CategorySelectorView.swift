//
//  CategorySelectorView.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/27/26.
//

import SwiftUI

struct CategorySelectorView: View {
    @Binding var selectedCategory: CartoonCategory

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(CartoonCategory.allCases) { category in
                    CategoryPillButton(
                        title: category.rawValue,
                        isSelected: selectedCategory == category
                    ) {
                        selectedCategory = category
                    }
                }
            }
            .padding(.horizontal, 16)
        }
    }
}
