//
//  MainTabView.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/29/26.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var tabViewModel = TabBarViewModel()
    @StateObject private var keyboard = KeyboardObserver()
    @StateObject private var favoritesStore = FavoritesStore()
    @StateObject private var homeViewModel = HomeViewModel()
    
    @State private var lastScrollOffset: CGFloat = 0
    @State private var isTabBarMinimized = false
    
    var body: some View {
        ZStack {
            
            currentTabView
                .environmentObject(favoritesStore)
                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                    let delta = value - lastScrollOffset
                    
                    if delta < -10 {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            isTabBarMinimized = true
                        }
                    } else if delta > 10 {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            isTabBarMinimized = false
                        }
                    }
                    
                    lastScrollOffset = value
                }
                .onChange(of: tabViewModel.selectedTab) { _ in
                    withAnimation(.spring()) {
                        isTabBarMinimized = false // Show the bar immediately on tab change
                        lastScrollOffset = 0      // Reset offset for the new view
                    }
                }
            
            if !keyboard.isKeyboardVisible {
                VStack {
                    Spacer()
                    FloatingTabBarView(viewModel: tabViewModel)
                        .scaleEffect(isTabBarMinimized ? 0.85 : 1)
                        .opacity(isTabBarMinimized ? 0 : 1)
                        .offset(y: isTabBarMinimized ? 90 : 0)
                        .transition(.move(edge: .bottom))
                }
                .animation(.easeInOut(duration: 0.25), value: keyboard.isKeyboardVisible)
            }
        }
    }
    
    @ViewBuilder
    private var currentTabView: some View {
        ZStack {
            HomeView(viewModel: homeViewModel)
                .opacity(tabViewModel.selectedTab == .home ? 1 : 0)
            
            FavoriteView()
                .opacity(tabViewModel.selectedTab == .favorite ? 1 : 0)
            
            ProfileView()
                .opacity(tabViewModel.selectedTab == .profile ? 1 : 0)
        }
    }
}


#Preview {
    MainTabView()
}
