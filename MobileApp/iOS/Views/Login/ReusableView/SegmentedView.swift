//
//  SegmentedView.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/13/26.
//

import SwiftUI

struct SegmentedView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Binding var authType: AuthType
    
    var body: some View {
        HStack(spacing:0) {
            Button {
                withAnimation {
                    authType = .login
                }
            } label: {
                Text(AppConstant.LoginScreen.loginTitle)
                    .fontWeight(authType == .login ? .semibold : .regular)
                    .foregroundColor(authType == .login ? (colorScheme == .light ? Color(uiColor: UIColor.white) : .gray) : .white)
                    .padding(.vertical, 12)
                    .padding(.horizontal, authType == .login ? 30 : 20)
                    .background(
                        ZStack {
                            if authType == .login {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black.opacity(0.3), lineWidth: 0.5)
                                    .zIndex(1)
                            }
                            
                            RoundedRectangle(cornerRadius: 20)
                                .fill(authType == .login ?
                                      Color(UIColor.black) :
                                        Color(UIColor.systemGray6))
                                .zIndex(0)
                        }
                    )
            }
            
            Button {
                withAnimation {
                    authType = .register
                }
            } label: {
                Text(AppConstant.LoginScreen.registerButtonTitle)
                    .fontWeight(authType == .register ? .semibold : .regular)
                    .foregroundColor(authType == .register ? (colorScheme == .light ? Color(uiColor: UIColor.white) : .gray) : .white)
                    .padding(.vertical, 12)
                    .padding(.horizontal, authType == .register ? 30 : 20)
                    .background(
                        ZStack {
                            if authType == .register {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black.opacity(0.3), lineWidth: 0.5)
                                    .zIndex(1)
                            }
                            
                            RoundedRectangle(cornerRadius: 20)
                                .fill(authType == .register ?
                                      Color(UIColor.black) :
                                        Color(UIColor.systemGray5))
                                .zIndex(0)
                        }
                    )
            }
        }
        .background(
            Color(UIColor.systemGray5)
        )
        .cornerRadius(20)
        .padding(.horizontal, 20)
        .padding(.bottom, 10)
        .frame(maxWidth: .infinity)
    }
}
