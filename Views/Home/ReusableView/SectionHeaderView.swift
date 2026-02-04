//
//  SectionHeaderView.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/26/26.
//

import SwiftUI

struct SectionHeaderView: View {
    let title: String
    let actionText: String
    let action: () -> Void

    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.primary)
            
            Spacer() // pushes See All to the right
            
            Button(action: action) {
                Text(actionText)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.blue)
            }
        }
        .padding(.leading, 5) 
    }
}

