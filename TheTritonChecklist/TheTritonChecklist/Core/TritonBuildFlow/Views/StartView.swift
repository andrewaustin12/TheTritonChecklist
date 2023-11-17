//
//  StartView.swift
//  TheTritonChecklist
//
//  Created by andrew austin on 11/14/23.
//

import SwiftUI

struct StartView: View {
    @StateObject var appViewModel = AppViewModel()
    
    var body: some View {
        NavigationStack {
            Spacer()
            VStack {
                
                Image("triton-app-icon")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    .font(.system(size: 200))
            }
            .padding()
                
            NavigationLink {
                PreAssembly1View(appViewModel: appViewModel)
            } label: {
                Text("Begin")
            }
            .modifier(PrimaryButtonModifier())
            .foregroundColor(.white)
            Spacer()
        }
    }
}
#Preview {
    StartView()
}
