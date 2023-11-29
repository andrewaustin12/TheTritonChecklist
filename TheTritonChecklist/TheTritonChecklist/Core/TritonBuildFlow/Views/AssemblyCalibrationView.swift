//
//  AssemblyCalibrationView.swift
//  TheTritonChecklist
//
//  Created by andrew austin on 11/15/23.
//

import SwiftUI

struct AssemblyCalibrationView: View {
    @ObservedObject var appViewModel: AppViewModel
    
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case oxygenFlushPercent
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Calibration")
                ProgressBarView(progress: Double((350/10) * 9))
                    .padding(.leading)
                
                Form {
                    // Step 26
                    Section {
                        
                        Toggle("Oxygen flush calibration check with mouthpiece slightly opened and OPV closed", isOn: $appViewModel.assemblyCalibrationViewModel.isOxygenFlushCompletedChecked)
                        
                        HStack {
                            Section(header: Text("Oxygen Value: ")) {
                                TextField("%", text: $appViewModel.assemblyCalibrationViewModel.oxygenFlushPercent)
                                    .focused($focusedTextField, equals: .oxygenFlushPercent)
                                    .onSubmit {focusedTextField = nil}
                                    .submitLabel(.done)
                                    .keyboardType(.decimalPad)
                                    .frame(width: 100)
                                    .padding(8) // Add padding for some spacing
                                    .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                            }
                        }
                        
                    } header: {
                        Text("Step 26")
                    }
                    
                    // Step 27
                    Section {
                        
                        Toggle("Perform calibration of Shearwater computer (if present) and then Monox", isOn: $appViewModel.assemblyCalibrationViewModel.isCalibrationCompleteChecked)
                        
                    } header: {
                        Text("Step 27")
                    }
                }
                .toggleStyle(SwitchToggleStyle(tint: .unitPrimaryForeground))
                
                NavigationLink("Next") {
                    AssemblyBcdAdvView(appViewModel: appViewModel)
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
    AssemblyCalibrationView(appViewModel: AppViewModel())
}
