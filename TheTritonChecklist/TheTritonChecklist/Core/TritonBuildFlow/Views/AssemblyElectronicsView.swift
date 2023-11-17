//
//  AssemblyElectronicsView.swift
//  TheTritonChecklist
//
//  Created by andrew austin on 11/15/23.
//

import SwiftUI

struct AssemblyElectronicsView: View {
    @ObservedObject var appViewModel: AppViewModel
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Electronics")
                ProgressBarView(progress: Double((350/9) * 6))
                    .padding(.leading)
                
                Form {
                    // Step 23
                    Section {
                        
                        Toggle("Cells housing to inhale counter-lung connection", isOn: $appViewModel.assemblyElectronicsViewModel.isCellHousingConnectedChecked)
                        
                    } header: {
                        Text("Step 23")
                    }
                }
                .toggleStyle(SwitchToggleStyle(tint: .unitPrimaryForeground))
                
                NavigationLink("Next") {
                    AssemblyPosNegTestView(appViewModel: appViewModel)
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
    AssemblyElectronicsView(appViewModel: AppViewModel())
}
