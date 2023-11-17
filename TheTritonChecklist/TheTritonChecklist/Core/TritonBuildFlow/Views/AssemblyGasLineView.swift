//
//  AssemblyGasLineView.swift
//  TheTritonChecklist
//
//  Created by andrew austin on 11/15/23.
//

import SwiftUI

struct AssemblyGasLineView: View {
    @ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Loop")
                ProgressBarView(progress: Double((350/9) * 5))
                    .padding(.leading)
                
                Form {
                    // Steps 20-22
                    Section {
                        
                        Toggle("ADV to exhale counter-lung connection", isOn: $appViewModel.assemblyGasLineViewModel.isAdvToCounterlungChecked)
                        Toggle("First stage properly screwed on oxygen valve", isOn: $appViewModel.assemblyGasLineViewModel.isFirstStageAttachedChecked)
                        Toggle("Oxygen cylinder fitting (no contact with OPV)", isOn: $appViewModel.assemblyGasLineViewModel.isOxygenCylinderFittedChecked)
                        
                    } header: {
                        Text("Steps 20-22")
                    }
                }
                .toggleStyle(SwitchToggleStyle(tint: .unitPrimaryForeground))
                
                NavigationLink("Next") {
                    AssemblyElectronicsView(appViewModel: appViewModel)
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
    AssemblyGasLineView(appViewModel: AppViewModel())
}
