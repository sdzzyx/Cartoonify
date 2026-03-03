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
            
            if viewModel.isLoading && !viewModel.hasLoaded {
                HomeSkeletonView()
            } else {
                HomeTopView(
                    searchText: $viewModel.searchText,
                    isSearchFocused: $isSearchFieldFocused,
                    allCartoons: viewModel.allCartoons,
                    categoryCartoons: $viewModel.categoryCartoons,
                    selectedCategory: $viewModel.selectedCategory
                )
            }
        }
        .animation(.easeIn(duration: 0.25), value: viewModel.isLoading)
        .coordinateSpace(name: "scroll")
        .task {
            guard !viewModel.hasLoaded else { return }

                viewModel.isLoading = true
                
                await viewModel.fetchAllCartoons()
                await viewModel.fetchCartoonsCategory(for: viewModel.selectedCategory)
                
                await favoritesStore.loadFavorites(from: viewModel.allCartoons)
                
                viewModel.isLoading = false
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
