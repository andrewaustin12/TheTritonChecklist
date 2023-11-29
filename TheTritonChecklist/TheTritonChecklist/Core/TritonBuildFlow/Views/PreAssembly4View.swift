//
//  PreAssembly4View.swift
//  TheTritonChecklist
//
//  Created by andrew austin on 11/15/23.
//

import SwiftUI

struct PreAssembly4View: View {
    @ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Scrubber / Canister")
                ProgressBarView(progress: Double((350/10) * 3))
                    .padding(.leading)
                
                Form {
                    // Steps 10-12
                    Section {
                        
                        Toggle("Scrubber filling with Sofnolime 797 in ventilated area", isOn: $appViewModel.preAssembly4ViewModel.isScrubberFilledChecked)
                        Toggle("Internal canister o-rings check - \n2 pieces (1 red on bottom & 1 black in groove)", isOn: $appViewModel.preAssembly4ViewModel.isCanisterOringsInspectedChecked)
                        Toggle("Close and label canister \n(M3S canister tape)", isOn: $appViewModel.preAssembly4ViewModel.isCanisterClosedLabeledChecked)
                        
                    } header: {
                        Text("Steps 10-12")
                    }
                }
                .toggleStyle(SwitchToggleStyle(tint: .unitPrimaryForeground))
                
                NavigationLink("Next") {
                    AssemblyCounterlungsView(appViewModel: appViewModel)
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
    PreAssembly4View(appViewModel: AppViewModel())
}
