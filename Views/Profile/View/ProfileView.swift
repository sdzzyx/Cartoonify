//
//  ProfileView.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/29/26.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Profile")
                    .font(.largeTitle)
            }
            .coordinateSpace(name: "scroll")
            .padding()
        }
    }
}

