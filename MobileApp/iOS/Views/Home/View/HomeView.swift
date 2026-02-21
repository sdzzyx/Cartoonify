//
//  HomeView.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/24/26.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.colorScheme) private var colorScheme
    @ObservedObject var viewModel: HomeViewModel
    @FocusState private var isSearchFieldFocused: Bool
    @EnvironmentObject var favoritesStore: FavoritesStore
    
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
            guard !viewModel.hasLoaded else { return }
            
            await viewModel.fetchAllCartoons()
            await viewModel.fetchCartoonsCategory(for: viewModel.selectedCategory)
            await favoritesStore.loadFavorites(from: viewModel.allCartoons)
            
            viewModel.hasLoaded = true
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
    // Initialize the dependencies
    let mockViewModel = HomeViewModel()
    let mockFavorites = FavoritesStore()
    
    HomeView(viewModel: mockViewModel)
        .environmentObject(mockFavorites)
}
