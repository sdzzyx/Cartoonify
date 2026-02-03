//
//  TopView.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/24/26.
//

import SwiftUI

struct HomeTopView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image(AppConstant.LoginScreen.logoImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 220)
            
        }
        .paddin/g(.top, 150)
    }
}
