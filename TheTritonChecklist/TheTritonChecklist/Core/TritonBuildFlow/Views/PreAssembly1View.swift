//
//  Assembly1View.swift
//  TheTritonChecklist
//
//  Created by andrew austin on 11/14/23.
//

import SwiftUI

struct PreAssembly1View: View {
    @ObservedObject var appViewModel: AppViewModel
    
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case computerVolts, cell1Air, cell2Air, cell3Air
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Monox PPO2 Display & Optional Shearwater Computer")
                ProgressBarView(progress: Double((350/10) * 0.1))
                    .padding(.leading)
                
                Form {
                    // Step 1
                    Section {
                        
                        Toggle("Turn on Monox display & Shearwater computer", isOn: $appViewModel.preAssembly1ViewModel.isComputerOnChecked)
                        
                        
                    } header: {
                        Text("Step 1")
                    }
                    // Step 2
                    Section {
                        
                        Toggle("Battery check Monox & Shearwater computer (if present)", isOn: $appViewModel.preAssembly1ViewModel.isComputerBatteryChecked)
                        
                        HStack {
                            Section(header: Text("Volts")) {
                                TextField("V", text: $appViewModel.preAssembly1ViewModel.computerVolts)
                                    .focused($focusedTextField, equals: .computerVolts)
                                    .onSubmit {focusedTextField = nil}
                                    .submitLabel(.done)
                                    .keyboardType(.decimalPad)
                                    .frame(width: 100)
                                    .padding(8) // Add padding for some spacing
                                    .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                            }
                        }
                    } header: {
                        Text("Step 2")
                    }
                    // Step 3
                    Section {
                        Toggle("Check that Monox charging plug is properly installed", isOn: $appViewModel.preAssembly1ViewModel.isMonoxInstalledChecked)
                    } header: {
                        Text("Step 3")
                    }
                    // Step 4
                    Section {
                        Toggle("Check sensor calibration in air (0.21-0.21-0.21 at sea level)", isOn: $appViewModel.preAssembly1ViewModel.isSensorCalibrationAirChecked)
                        VStack {
                            Text("Record Values:")
                            HStack {
                                
                                Section(header: Text("Cell 1")) {
                                    TextField("%", text: $appViewModel.preAssembly1ViewModel.cell1Air)
                                        .focused($focusedTextField, equals: .cell1Air)
                                        .onSubmit {focusedTextField = .cell2Air}
                                        .submitLabel(.next)
                                        .keyboardType(.numbersAndPunctuation)
                                        .padding(8) // Add padding for some spacing
                                        .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                                }
                                Section(header: Text("Cell 2")) {
                                    TextField("%", text: $appViewModel.preAssembly1ViewModel.cell2Air)
                                        .focused($focusedTextField, equals: .cell2Air)
                                        .onSubmit {focusedTextField = .cell3Air}
                                        .submitLabel(.next)
                                        .keyboardType(.numbersAndPunctuation)
                                        .padding(8) // Add padding for some spacing
                                        .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                                }
                                Section(header: Text("Cell 3")) {
                                    TextField("%", text: $appViewModel.preAssembly1ViewModel.cell3Air)
                                        .focused($focusedTextField, equals: .cell3Air)
                                        .onSubmit {focusedTextField = nil}
                                        .submitLabel(.done)
                                        .keyboardType(.numbersAndPunctuation)
                                        .padding(8) // Add padding for some spacing
                                        .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                                }
                                
                            }
                        }
                        
                    } header: {
                        Text("Step 4")
                    }
                }
                .toggleStyle(SwitchToggleStyle(tint: .unitPrimaryForeground))
                
                NavigationLink("Next") {
                    PreAssembly2View(appViewModel: appViewModel)
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
    PreAssembly1View(appViewModel: AppViewModel())
}
