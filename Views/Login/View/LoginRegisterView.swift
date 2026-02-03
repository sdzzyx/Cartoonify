//
//  ContentView.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/13/26.
//

import SwiftUI

struct LoginRegisterView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPass = false
    @State private var authType: AuthType = .login
    
    @FocusState private var isEmailFocused
    @FocusState private var isPasswordFocused
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            TopView()
            SegmentedView(authType: $authType)
            
            VStack(spacing: 15) {
                emailField
                passwordField
            }
            
            submitButton
            BottomView(authType: $authType)
        }
        .padding()
    }
}

// MARK: - Subviews
private extension LoginRegisterView {
    
    var emailField: some View {
        TextField(
            AppConstant.LoginScreen.emailPlaceholder,
            text: $email
        )
        .focused($isEmailFocused)
        .textFieldStyle(
            AuthTextFieldStyle(isFocused: $isEmailFocused)
        )
    }
    
    var passwordField: some View {
        ZStack {
            // Visible password
            TextField(
                AppConstant.LoginScreen.passwordPlaceholder,
                text: $password
            )
            .focused($isPasswordFocused)
            .textFieldStyle(
                AuthTextFieldStyle(isFocused: $isPasswordFocused)
            )
            .overlay(alignment: .trailing) {
                togglePasswordButton
            }
            .opacity(showPass ? 1 : 0)
            .zIndex(1)
            
            // Hidden password
            SecureField(
                AppConstant.LoginScreen.passwordPlaceholder,
                text: $password
            )
            .focused($isPasswordFocused)
            .textFieldStyle(
                AuthTextFieldStyle(isFocused: $isPasswordFocused)
            )
            .overlay(alignment: .trailing) {
                togglePasswordButton
            }
            .opacity(showPass ? 0 : 1)
        }
    }
    
    var togglePasswordButton: some View {
        Button {
            withAnimation {
                showPass.toggle()
            }
        } label: {
            Image(
                systemName: showPass
                ? AppConstant.LoginScreen.showPasswordImageName
                : AppConstant.LoginScreen.hidePasswordImageName
            )
            .padding()
            .foregroundStyle(Color(UIColor.darkGray))
        }
    }
    
    var submitButton: some View {
        Button {
            // TODO: Handle submit
        } label: {
            Text(
                authType == .login
                ? AppConstant.LoginScreen.loginButtonTitle
                : AppConstant.LoginScreen.registerButtonTitle
            )
        }
        .buttonStyle(AuthButtonType())
    }
}

#Preview {
    LoginRegisterView()
}

