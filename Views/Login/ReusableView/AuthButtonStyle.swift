//
//  AuthButtonStyle.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/13/26.
//

import SwiftUI

struct AuthButtonType: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.vertical, 18)
            .foregroundStyle(Color.white)
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .background(
                LinearGradient(stops: [
                    .init(color: .black, location: 0.0),
                    //.init(color: Color.white, location: 1.0) for gradient
                ], startPoint: .leading, endPoint: .trailing
                )
            )
            .cornerRadius(15)
            .brightness(configuration.isPressed ? 0.05 : 0)
            .opacity(configuration.isPressed ? 0.5 : 1)
            .padding(.vertical, 12)
    }
}
