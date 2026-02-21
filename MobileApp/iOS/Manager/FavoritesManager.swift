//
//  FavoritesManager.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 2/5/26.
//

import SwiftUI
import Supabase

@MainActor
final class FavoritesStore: ObservableObject {
    @Published var favorites: [Cartoon] = []
    
    private var client: SupabaseClient {
        SupabaseManager.shared.client
    }
    
    private var userId: UUID? {
        client.auth.currentUser?.id
    }
    
    func loadFavorites(from cartoons: [Cartoon]) async {
        guard let userId else { return }
        
        do {
            let rows: [FavoritesRow] = try await client
                .from("favorites")
                .select("cartoon_id")
                .eq("user_id", value: userId)
                .execute()
                .value
            
            let ids = Set(rows.map { $0.cartoon_id })
            
            favorites = cartoons.filter { ids.contains($0.id) }
        } catch {
            print("Load favorites error: \(error)")
        }
    }
    
    private func addFavorites(_ cartoon: Cartoon) async {
        guard let userId else { return }
        
        do {
            try await client
                .from("favorites")
                .insert([
                    "user_id": userId.uuidString,
                    "cartoon_id": cartoon.id.uuidString
                ])
                .execute()
        } catch {
            print("Insert favorite error: \(error)")
        }
    }
    
    private func removeFavorites(_ cartoon: Cartoon) async {
        guard let userId else { return }
        
        do {
            try await client
                .from("favorites")
                .delete()
                .eq("user_id", value: userId)
                .eq("cartoon_id", value: cartoon.id)
                .execute()
        } catch {
            print("Remove favorite error: \(error)")
        }
    }

    func toggleFavorite(_ cartoon: Cartoon) {
        Task { @MainActor in
            if let index = favorites.firstIndex(where: { $0.id == cartoon.id }) {
                favorites.remove(at: index)
                await removeFavorites(cartoon)
            } else {
//                var newCartoon = cartoon
//                newCartoon.isFavorite = true
                favorites.append(cartoon)
                await addFavorites(cartoon)
            }
        }
    }

    func isFavorite(_ cartoon: Cartoon) -> Bool {
        favorites.contains(where: { $0.id == cartoon.id })
    }
}
