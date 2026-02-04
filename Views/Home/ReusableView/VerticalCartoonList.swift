//
//  VerticalCartoonList.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/27/26.
//

import SwiftUI

struct VerticalCartoonList: View {
    @Binding var cartoons: [Cartoon]

    var body: some View {
        LazyVStack(spacing: 16) {
            ForEach($cartoons) { $cartoon in
                VerticalCartoonCard(cartoon: $cartoon)
            }

            Color.clear.frame(height: 100)
        }
        .padding(.horizontal, 16)
    }
}

