//
//  HomeViewModel.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/24/26.
//

import SwiftUI
import Foundation
import Supabase


@MainActor
final class HomeViewModel: ObservableObject {
    @Published var searchText: String = ""

    // Top section (ALL cartoons)
    @Published var allCartoons: [Cartoon] = []

    // Category section (changes when category changes)
    @Published var categoryCartoons: [Cartoon] = []

    @Published var isLoading = false
    @Published var selectedCategory: CartoonCategory = .popular

    // Fetch ALL cartoons (CN Favorites)
    func fetchAllCartoons() async {
        isLoading = true
        defer { isLoading = false }

        do {
            allCartoons = try await SupabaseManager.shared.client
                .from("cartoons")
                .select()
                .order("created_at", ascending: false)
                .execute()
                .value
        } catch {
            print("Fetch all cartoons error:", error)
        }
    }

    // Fetch cartoons per category
    func fetchCartoonsCategory(for category: CartoonCategory) async {
        
        isLoading = true
        defer { isLoading = false }

        do {
            let response: [CartoonCategoryResponse] =
                try await SupabaseManager.shared.client
                    .from("cartoon_categories")
                    .select("""
                        cartoons (
                            id,
                            title,
                            description,
                            image_url,
                            created_at
                        ),
                        categories!inner (
                            name
                        )
                    """)
                    .eq("categories.name", value: category.rawValue)
                    .execute()
                    .value
            
            print("Fetched \(response.count) cartoons for \(category.rawValue)")

            categoryCartoons = response.map { $0.cartoons }

        } catch {
            print("Fetch category error:", error)
        }
    }
    
    func toggleFavorite(for cartoon: Cartoon) {
        if let index = allCartoons.firstIndex(where: { $0.id == cartoon.id }) {
            allCartoons[index].isFavorite.toggle()
        }
        
        if let index = categoryCartoons.firstIndex(where: { $0.id == cartoon.id }) {
            categoryCartoons[index].isFavorite.toggle()
        }
    }
}


