//
//  ShimmerView.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 2/22/26.
//
import SwiftUI

extension View {
    func shimmer() -> some View {
        self
            .overlay(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.white.opacity(0.3),
                        Color.white.opacity(0.7),
                        Color.white.opacity(0.3)
                    ]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .rotationEffect(.degrees(30))
                .blendMode(.plusLighter)
                .mask(self)
                .animation(
                    .linear(duration: 1.2)
                    .repeatForever(autoreverses: false),
                    value: UUID()
                )
            )
    }
}
