//
//  CartoonCategory.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/27/26.
//

enum CartoonCategory: String, CaseIterable, Identifiable {
    case popular = "Popular"
    case classic = "Classic"
    case kidsFavorites = "Kids Favorites"

    var id: String { rawValue }
}

