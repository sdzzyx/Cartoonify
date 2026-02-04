//
//  TabBarViewModel.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/29/26.
//

import SwiftUI

final class TabBarViewModel: ObservableObject {
    @Published var selectedTab: TabItem = .home
}
