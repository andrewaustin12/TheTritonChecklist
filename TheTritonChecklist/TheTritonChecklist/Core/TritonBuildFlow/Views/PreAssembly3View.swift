//
//  PreAssembly3View.swift
//  TheTritonChecklist
//
//  Created by andrew austin on 11/15/23.
//

import SwiftUI

struct PreAssembly3View: View {
    @ObservedObject var appViewModel: AppViewModel
    
    
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case DilBailAnalyzed, DilBailPressure
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Diluent / Bailout Cylinder")
                ProgressBarView(progress: Double((350/9) * 2))
                    .padding(.leading)
                
                Form {
                    // Step 8
                    Section {
                        
                        Toggle("Diluent & bailout cylinder(s) check O2 % (He %) and label", isOn: $appViewModel.preAssembly3ViewModel.isDilBailPercentLabelChecked)
                        HStack {
                            Section(header: Text("Dil/Bailout Content: ")) {
                                TextField("%", text: $appViewModel.preAssembly3ViewModel.DilBailAnalyzed)
                                    .focused($focusedTextField, equals: .DilBailAnalyzed)
                                    .onSubmit {focusedTextField = nil}
                                    .submitLabel(.done)
                                    .keyboardType(.decimalPad)
                                    .frame(width: 100)
                                    .padding(8) // Add padding for some spacing
                                    .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                            }
                        }
                        
                    } header: {
                        Text("Step 8")
                    }
                    
                    // Step 9
                    Section {
                        
                        Toggle("Diluent & bailout cylinder(s) pressure check and enough for the dive", isOn: $appViewModel.preAssembly3ViewModel.isDilBailPressureCheckChecked)
                        HStack {
                            Section(header: Text("Dil/Bailout Pressure: ")) {
                                TextField("Bar", text: $appViewModel.preAssembly3ViewModel.DilBailPressure)
                                    .focused($focusedTextField, equals: .DilBailPressure)
                                    .onSubmit {focusedTextField = nil}
                                    .submitLabel(.done)
                                    .keyboardType(.decimalPad)
                                    .frame(width: 100)
                                    .padding(8) // Add padding for some spacing
                                    .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                            }
                        }
                        
                    } header: {
                        Text("Step 9")
                    }
                }
                .toggleStyle(SwitchToggleStyle(tint: .unitPrimaryForeground))
                
                NavigationLink("Next") {
                    PreAssembly4View(appViewModel: appViewModel)
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
    PreAssembly3View(appViewModel: AppViewModel())
}
