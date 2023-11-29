//
//  AssemblyBcdAdvView.swift
//  TheTritonChecklist
//
//  Created by andrew austin on 11/15/23.
//

import SwiftUI

struct AssemblyBcdAdvView: View {
    @ObservedObject var appViewModel: AppViewModel
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "ADV & BCD Check")
                ProgressBarView(progress: Double((350/10) * 10))
                    .padding(.leading)
                
                Form {
                    // Steps 28-29
                    Section {
                        
                        Toggle("Connect ADV & BCD", isOn: $appViewModel.assemblyBcdAdvViewModel.isAdvBcdConnectedChecked)
                        
                        Toggle("Check ADV function, no free flow, manual addition", isOn: $appViewModel.assemblyBcdAdvViewModel.isAdvFunctionChecked)
                        
                    } header: {
                        Text("Steps 28-29")
                    }
                }
                .toggleStyle(SwitchToggleStyle(tint: .unitPrimaryForeground))
                
                NavigationLink("Next") {
                    TritonSummaryView(appViewModel: appViewModel)
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
    AssemblyBcdAdvView(appViewModel: AppViewModel())
}
