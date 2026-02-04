//
//  TabItem.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/29/26.
//

import SwiftUI

enum TabItem: String, CaseIterable, Identifiable {
    case home = "Home"
    case favorite = "Favorite"
    case profile = "Profile"

    var id: String { rawValue }

    // Selected icon
    var selectedIcon: String {
        switch self {
        case .home:
            return "home.fill"
        case .favorite:
            return "favorite.fill"
        case .profile:
            return "profile.fill"
        }
    }

    // Unselected icon
    var unselectedIcon: String {
        switch self {
        case .home:
            return "home.unfill"
        case .favorite:
            return "favorite.unfill"
        case .profile:
            return "profile.unfill"
        }
    }
}

