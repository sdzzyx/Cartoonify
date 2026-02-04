//
//  HomeView.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/24/26.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.colorScheme) private var colorScheme
    @StateObject private var viewModel = HomeViewModel()
    @FocusState private var isSearchFieldFocused: Bool
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            HomeTopView(
                searchText: $viewModel.searchText,
                isSearchFocused: $isSearchFieldFocused,
                allCartoons: viewModel.allCartoons,
                categoryCartoons: $viewModel.categoryCartoons,
                selectedCategory: $viewModel.selectedCategory
            )
        }
        .coordinateSpace(name: "scroll")
        .task {
            await viewModel.fetchAllCartoons()
            await viewModel.fetchCartoonsCategory(for: viewModel.selectedCategory)
        }
        .onChange(of: viewModel.selectedCategory) { newCategory in
            Task {
                await viewModel.fetchCartoonsCategory(for: newCategory)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            isSearchFieldFocused = false
        }
        .gesture(
            DragGesture()
                .onChanged { _ in
                    isSearchFieldFocused = false
                }
        )
    }
}



#Preview {
    HomeView()
}
