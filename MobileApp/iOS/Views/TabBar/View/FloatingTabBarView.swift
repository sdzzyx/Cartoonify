//
//  FloatingTabBarView.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/29/26.
//


import SwiftUI

struct FloatingTabBarView: View {
    @ObservedObject var viewModel: TabBarViewModel
    
    var body: some View {
        HStack {
            ForEach(TabItem.allCases) { tab in
                Spacer()
                
                Button {
                    withAnimation(.spring()) {
                        viewModel.selectedTab = tab
                    }
                } label: {
                    VStack(spacing: 6) {
                        
                        Image(
                            viewModel.selectedTab == tab
                            ? tab.selectedIcon
                            : tab.unselectedIcon
                        )
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 22, height: 22)
                        .foregroundColor(
                            viewModel.selectedTab == tab ? .blue : .gray
                        )
                        
                        Text(tab.rawValue)
                            .font(.caption)
                            .foregroundColor(
                                viewModel.selectedTab == tab ? .blue : .gray
                            )
                    }
                }
                
                Spacer()
            }
        }
        
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 4)
        )
        .padding(.horizontal, 12)
        .padding(.bottom, 20)
    }
}
