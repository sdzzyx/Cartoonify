//
//  ContentView.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/13/26.
//

import SwiftUI

enum AuthType {
    case login
    case register
}

struct LoginRegisterView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @FocusState private var isEmailFocused
    @FocusState private var isPasswordFocused
    
    @State private var showPass = false
    
    @State var authType: AuthType = .login
    var body: some View {
        ScrollView(showsIndicators: false) {
            TopView()
            SegmentedView(authType: $authType)
            
            VStack(spacing: 15) {
                TextField(text: $email) {
                    Text(AppConstant.LoginScreen.emailPlaceholder)
                }
                .focused($isEmailFocused)
                .textFieldStyle(AuthTextFieldStyle(isFocused: $isEmailFocused))
                ZStack {
                    
                    TextField(text: $password) {
                        Text(AppConstant.LoginScreen.passwordPlaceholder)
                    }
                    .focused($isPasswordFocused)
                    .textFieldStyle(AuthTextFieldStyle(isFocused: $isPasswordFocused))
                    .overlay(alignment: .trailing, content: {
                        Button {
                            withAnimation {
                                showPass.toggle()
                            }
                        } label: {
                            Image(systemName: showPass ? AppConstant.LoginScreen.showPasswordImageName : AppConstant.LoginScreen.hidePasswordImageName)
                                .padding()
                                .foregroundStyle(Color(UIColor.darkGray))
                        }
                    })
                    .opacity(showPass ? 1 : 0)
                    .zIndex(1)
                    
                    SecureField(text: $password) {
                        Text(AppConstant.LoginScreen.passwordPlaceholder)
                    }
                    .focused($isPasswordFocused)
                    .textFieldStyle(AuthTextFieldStyle(isFocused: $isPasswordFocused))
                    .overlay(alignment: .trailing) {
                        Button {
                            withAnimation {
                                showPass.toggle()
                            }
                        } label: {
                            Image(systemName: showPass ? AppConstant.LoginScreen.showPasswordImageName : AppConstant.LoginScreen.hidePasswordImageName)
                                .padding()
                                .foregroundStyle(Color(UIColor.darkGray))
                        }
                    }
                    .opacity(showPass ? 0 : 1)
                }
            }
            //.padding()
            
            Button {
                
            } label: {
                Text(authType == .login ? AppConstant.LoginScreen.loginButtonTitle : AppConstant.LoginScreen.registerButtonTitle)
            }
            .buttonStyle(AuthButtonType())
            
            BottomView(authType: $authType)
        }
        .padding()
    }
}

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

struct AuthTextFieldStyle: TextFieldStyle {
    @Environment(\.colorScheme) private var colorScheme
    
    let isFocused: FocusState<Bool>.Binding
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .font(.system(size: 18, weight: .regular, design: .rounded))
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(isFocused.wrappedValue ? Color.black :
                                    Color.gray.opacity(0.5), lineWidth: 0.5)
                        .zIndex(1)
                    
                    RoundedRectangle(cornerRadius: 16)
                        .fill(colorScheme == .light ? Color(.systemGray6) :
                                Color(uiColor: UIColor.darkGray))
                        .zIndex(0)
                }
            )
            .animation(.easeInOut(duration: 0.2), value: isFocused.wrappedValue)
    }
}


struct TopView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image(AppConstant.LoginScreen.logoImageName)
                .resizable()
                .cornerRadius(30)
                .aspectRatio(contentMode: .fit)
                .frame(width: 85)
            
            Text(AppConstant.LoginScreen.loginScreenTitle)
                .font(.system(size: 35, weight: .bold, design: .rounded,))
            
        }
        .padding(.top, 40)
    }
}

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
                Text(AppConstant.LoginScreen.loginScreenTitle)
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

#Preview {
    LoginRegisterView()
}
