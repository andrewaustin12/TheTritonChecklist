//
//  AssemblyCounterlungsView.swift
//  TheTritonChecklist
//
//  Created by andrew austin on 11/15/23.
//

import SwiftUI

struct AssemblyCounterlungsView: View {
    @ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Scrubber / Canister")
                ProgressBarView(progress: Double((350/9) * 4))
                    .padding(.leading)
                
                Form {
                    // Steps 13-15
                    Section {
                        
                        Toggle("Exhale counter-lung fitting", isOn: $appViewModel.assemblyCounterlungsViewModel.isExhaleFittingChecked)
                        Toggle("Inhale counter-lung fitting & check no water is present in the lung", isOn: $appViewModel.assemblyCounterlungsViewModel.isInhaleFittingChecked)
                        Toggle("Canister to counter-lung connection", isOn: $appViewModel.assemblyCounterlungsViewModel.isCanisterCounterlungConnectedChecked)
                        
                    } header: {
                        Text("Steps 13-15")
                    }
                }
                .toggleStyle(SwitchToggleStyle(tint: .unitPrimaryForeground))
                
                NavigationLink("Next") {
                    AssemblyLoopView(appViewModel: appViewModel)
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
    AssemblyCounterlungsView(appViewModel: AppViewModel())
}
