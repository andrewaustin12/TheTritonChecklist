//
//  SplashView.swift
//  TheTritonChecklist
//
//  Created by andrew austin on 11/14/23.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            Image("triton-app-icon")
                .resizable()
                .frame(width: 400,height: 400)
        }
    }
}

#Preview {
    SplashView()
}
