//
//  LoginRegisterViewModel.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 2/3/26.
//

import SwiftUI

final class LoginRegisterViewModel: ObservableObject {

    // MARK: - UI State
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    @Published var authType: AuthType = .login

    // MARK: - Validation
    var isLoginEnabled: Bool {
        !email.isEmpty && !password.isEmpty
    }

    // MARK: - Actions
    func toggleAuthType() {
        withAnimation {
            authType = authType == .login ? .register : .login
        }
    }

    func togglePasswordVisibility() {
        withAnimation {
            showPassword.toggle()
        }
    }

    func submit() {
        switch authType {
        case .login:
            login()
        case .register:
            register()
        }
    }

    private func login() {
        print("Logging in with \(email)")
        // API call
    }

    private func register() {
        print("Registering with \(email)")
        // API call
    }
}
