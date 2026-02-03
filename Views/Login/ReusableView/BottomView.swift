//
//  BottomView.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/13/26.
//

import SwiftUI

struct BottomView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Binding var authType: AuthType
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 3) {
                Text(authType == .login ? AppConstant.LoginScreen.dontHaveAccountText : AppConstant.LoginScreen.alreadyHaveAccountText)
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                
                Button {
                    if authType == .login {
                        withAnimation {
                            authType = .register
                        }
                    } else {
                        withAnimation {
                            authType = .login
                        }
                    }
                } label: {
                    Text(authType == .login ? AppConstant.LoginScreen.registerButtonTitle : AppConstant.LoginScreen.loginButtonTitle)
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                }
            }
            
            HStack {
                Rectangle()
                    .frame(height: 1.5)
                    .foregroundStyle(Color.gray.opacity(0.3))
                Text(AppConstant.LoginScreen.orText)
                    .font(.system(size: 15, weight: .regular, design: .rounded))
                Rectangle()
                    .frame(height: 1.5)
                    .foregroundStyle(Color.gray.opacity(0.3))
            }
            
            HStack(spacing: 20) {
                // Apple
                Button {
                    
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1.5)
                        .frame(width: 50, height: 50)
                        .foregroundStyle(Color.gray.opacity(0.3))
                        .overlay {
                            Image(AppConstant.LoginScreen.appleImageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 45)
                                .foregroundStyle(colorScheme == .light ? .black : .white)
                        }
                }
                
                // Google
                Button {
                    
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1.5)
                        .frame(width: 50, height: 50)
                        .foregroundStyle(Color.gray.opacity(0.3))
                        .overlay {
                            Image(AppConstant.LoginScreen.googleImageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 45)
                                .foregroundStyle(colorScheme == .light ? .black : .white)
                        }
                }
            }
        }
        .padding()
    }
}
