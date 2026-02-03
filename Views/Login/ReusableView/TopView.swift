//
//  TopView.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/13/26.
//

import SwiftUI

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
