//
//  HorizontalCartoonList.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/26/26.
//

import SwiftUI

struct HorizontalCartoonList: View {
    let cartoons: [Cartoon]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 17) {
                ForEach(cartoons) { cartoon in
                    CartoonThumbnail(cartoon: cartoon)
                }
            }
            .padding(.leading, 15)
        }
    }
}
