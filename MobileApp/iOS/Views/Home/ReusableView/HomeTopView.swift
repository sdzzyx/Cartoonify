//
//  TopView.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/24/26.
//

import SwiftUI

struct HomeTopView: View {
    //@StateObject private var viewModel = HomeViewModel()
    @Binding var searchText: String
    let isSearchFocused: FocusState<Bool>.Binding
    let allCartoons: [Cartoon]
    @Binding var categoryCartoons: [Cartoon]
    @Binding var selectedCategory: CartoonCategory
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            // Logo
            HStack {
                Spacer()
                Image(AppConstant.LoginScreen.logoImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 220)
                Spacer()
            }
            
            // Search
            SearchTextField(
                text: $searchText,
                isFocused: isSearchFocused
            )
            .padding(.horizontal)
            
            // Section header
            SectionHeaderView(
                title: AppConstant.HomeScreen.cnFavoritesText,
                actionText: AppConstant.HomeScreen.seeAllText
            ) {
                print("See All tapped")
            }
            .padding(.horizontal)
            
            // Horizontal Image list
            HorizontalCartoonList(cartoons: allCartoons)
            
            // Category Buttons
            CategorySelectorView(
                selectedCategory: $selectedCategory
            )
            
            // Category results
            VerticalCartoonList(cartoons: $categoryCartoons)
            
        }
        .padding(.top, 20)
    }
}
