//
//  AssemblyLoopView.swift
//  TheTritonChecklist
//
//  Created by andrew austin on 11/15/23.
//

import SwiftUI

struct AssemblyLoopView: View {
    @ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Loop")
                ProgressBarView(progress: Double((350/9) * 5))
                    .padding(.leading)
                
                Form {
                    // Steps 16-19
                    Section {
                        
                        Toggle("Mouthpiece visual check", isOn: $appViewModel.assemblyLoopViewModel.isMouthpieceInspectedChecked)
                        Toggle("Internal hoses & mushroom valves visual check", isOn: $appViewModel.assemblyLoopViewModel.isHosesMushroomValvedInpectedChecked)
                        Toggle("Mushroom seal check", isOn: $appViewModel.assemblyLoopViewModel.isMushroomSealInspectedChecked)
                        Toggle("Loop to counter-lung connection", isOn: $appViewModel.assemblyLoopViewModel.isCounterlungConnectedChecked)
                        
                    } header: {
                        Text("Steps 16-19")
                    }
                }
                .toggleStyle(SwitchToggleStyle(tint: .unitPrimaryForeground))
                
                NavigationLink("Next") {
                    AssemblyGasLineView(appViewModel: appViewModel)
                }
                .modifier(PrimaryButtonModifier())
                .foregroundColor(.white)
                .padding(.top)
                .padding(.bottom)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            MainTabView()
                        } label: {
                            Image(systemName: "house")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AssemblyLoopView(appViewModel: AppViewModel())
}
