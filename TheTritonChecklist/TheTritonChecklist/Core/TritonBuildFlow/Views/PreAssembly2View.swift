//
//  PreAssembly2View.swift
//  TheTritonChecklist
//
//  Created by andrew austin on 11/15/23.
//

import SwiftUI

struct PreAssembly2View: View {
    @ObservedObject var appViewModel: AppViewModel
    
    
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case O2CylinderAnalyzed, O2CylinderPressure, CmfFlow
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Oxygen Cylinder")
                ProgressBarView(progress: Double((350/9) * 1))
                    .padding(.leading)
                
                Form {
                    // Step 5
                    Section {
                        
                        Toggle("Oxygen cylinder O2 % Check", isOn: $appViewModel.preAssembly2ViewModel.isO2CylinderAnalyzedChecked)
                        HStack {
                            Section(header: Text("Oxygen Content: ")) {
                                TextField("%", text: $appViewModel.preAssembly2ViewModel.o2CylinderAnalyzed)
                                    .focused($focusedTextField, equals: .O2CylinderAnalyzed)
                                    .onSubmit {focusedTextField = nil}
                                    .submitLabel(.done)
                                    .keyboardType(.decimalPad)
                                    .frame(width: 100)
                                    .padding(8) // Add padding for some spacing
                                    .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                            }
                        }
                        
                    } header: {
                        Text("Step 5")
                    }
                    
                    // Step 6
                    Section {
                        
                        Toggle("Oxygen tank pressure check with Triton O2 regulator \n(>100 bar or >1500 psi)", isOn: $appViewModel.preAssembly2ViewModel.isO2CylinderPressureCheckChecked)
                        HStack {
                            Section(header: Text("Oxygen Pressure: ")) {
                                TextField("Bar", text: $appViewModel.preAssembly2ViewModel.o2CylinderPressure)
                                    .focused($focusedTextField, equals: .O2CylinderPressure)
                                    .onSubmit {focusedTextField = nil}
                                    .submitLabel(.done)
                                    .keyboardType(.decimalPad)
                                    .frame(width: 100)
                                    .padding(8) // Add padding for some spacing
                                    .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                            }
                        }
                        
                    } header: {
                        Text("Step 6")
                    }
                    
                    // Step 7
                    Section {
                        
                        Toggle("Check and note CMF flow \n(10 bar or 150 psi drop in 7 sec)", isOn: $appViewModel.preAssembly2ViewModel.isCmfFlowChecked)
                        HStack {
                            Section(header: Text("Value: ")) {
                                TextField("Sec", text: $appViewModel.preAssembly2ViewModel.cmfFlow)
                                    .focused($focusedTextField, equals: .CmfFlow)
                                    .onSubmit {focusedTextField = nil}
                                    .submitLabel(.done)
                                    .keyboardType(.decimalPad)
                                    .frame(width: 100)
                                    .padding(8) // Add padding for some spacing
                                    .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                            }
                        }
                        
                    } header: {
                        Text("Step 7")
                    }
                   
                }
                .toggleStyle(SwitchToggleStyle(tint: .unitPrimaryForeground))
                
                NavigationLink("Next") {
                    PreAssembly3View(appViewModel: appViewModel)
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
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Dismiss") { focusedTextField = nil }
                    }
                }
            }
        }
    }
}

#Preview {
    PreAssembly2View(appViewModel: AppViewModel())
}
