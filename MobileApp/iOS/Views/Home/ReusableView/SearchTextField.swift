//
//  SearchTextField.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/24/26.
//
import SwiftUI

struct SearchTextField: View {
    @Binding var text: String
    let isFocused: FocusState<Bool>.Binding
    
    var body: some View {
        HStack(spacing: 10) {
            
            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
            
            Image(AppConstant.HomeScreen.searchImageName)
                .resizable()
                .renderingMode(.template)
                .frame(width: 18, height: 18)
                .foregroundColor(.gray)
            
            TextField(
                AppConstant.HomeScreen.searchPlaceholder,
                text: $text
            )
            .focused(isFocused)
            .submitLabel(.search)
            .font(.system(size: 16, weight: .regular, design: .rounded))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(.systemGray6))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.gray.opacity(0.3), lineWidth: 0.5)
        )
    }
}
