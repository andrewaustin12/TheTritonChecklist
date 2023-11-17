//
//  AssemblyPosNegTestView.swift
//  TheTritonChecklist
//
//  Created by andrew austin on 11/15/23.
//

import SwiftUI

struct AssemblyPosNegTestView: View {
    @ObservedObject var appViewModel: AppViewModel
    
    @Environment(\.presentationMode) var presentationMode
    @State var showSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Pos/Neg Tests")
                ProgressBarView(progress: Double((350/9) * 7))
                    .padding(.leading)
                
                Form {
                    // Step 24
                    Section {
                        
                        Toggle("Positive pressure test - 2 min", isOn: $appViewModel.assemblyPosNegTestViewModel.isPosTestCompleteChecked)
                        Button {
                            showSheet.toggle()
                        } label: {
                            Text("Timer")
                                .font(.title)
                                .frame(width: 300, height: 44)
                                .background(Color(.unitPrimaryForeground))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .sheet(isPresented: $showSheet) {
                            CountdownTimerView()
                        }
                        
                    } header: {
                        Text("Step 24")
                    }
                    
                    // Step 25
                    Section {
                        
                        Toggle("Negative pressure test - 2 min", isOn: $appViewModel.assemblyPosNegTestViewModel.isNegTestCompleteChecked)
                        Button {
                            showSheet.toggle()
                        } label: {
                            Text("Timer")
                                .font(.title)
                                .frame(width: 300, height: 44)
                                .background(Color(.unitPrimaryForeground))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .sheet(isPresented: $showSheet) {
                            CountdownTimerView()
                        }
                        
                    } header: {
                        Text("Step 25")
                    }
                }
                .toggleStyle(SwitchToggleStyle(tint: .unitPrimaryForeground))
                
                NavigationLink("Next") {
                    AssemblyCalibrationView(appViewModel: appViewModel)
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
    AssemblyPosNegTestView(appViewModel: AppViewModel())
}
