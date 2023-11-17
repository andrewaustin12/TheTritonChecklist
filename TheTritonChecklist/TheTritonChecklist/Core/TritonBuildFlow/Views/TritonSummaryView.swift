//
//  TritonSummaryView.swift
//  TheTritonChecklist
//
//  Created by andrew austin on 11/15/23.
//

import SwiftUI

struct TritonSummaryView: View {
    @ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack {
            VStack{
                
                if appViewModel.areAllStepsCompleted {
                    SummaryCard(isComplete: true, step: "All Steps Complete!")
                        .padding(.top)
                        .padding(.bottom)
                    
                    ScrollView {
                    
                        Text("Summary of Build")
                            .font(.largeTitle)
                        SummaryMonoxAirReading(title: "Monox Readings",
                                              cell1: appViewModel.preAssembly1ViewModel.cell1Air,
                                              cell2: appViewModel.preAssembly1ViewModel.cell2Air,
                                               cell3: appViewModel.preAssembly1ViewModel.cell3Air,
                                               volts: appViewModel.preAssembly1ViewModel.computerVolts
                        )
                        SummaryOxygenCylinderCard(title: "Oxygen Cylinder",
                                       o2Content: appViewModel.preAssembly2ViewModel.o2CylinderAnalyzed,
                                       o2Pressure: appViewModel.preAssembly2ViewModel.o2CylinderPressure,
                                       cmfFlow: appViewModel.preAssembly2ViewModel.cmfFlow
                        )
                        SummaryDiluentCard(
                            title: "Diluent/Bailout Cylinder",
                            dilContent: appViewModel.preAssembly3ViewModel.DilBailAnalyzed,
                            dilPressure: appViewModel.preAssembly3ViewModel.DilBailPressure
                        )
                        SummaryCalibrationCard(title: "Calibration", o2Calibration: appViewModel.assemblyCalibrationViewModel.oxygenFlushPercent
                        )
                        

                    }
                    
                } else {
                   
                   
                    Text("Some steps are not finished:")
                        .font(.title)
                        .bold()
                    
                    ScrollView {
                        Section {
                            ForEach(appViewModel.incompleteSteps, id: \.self) { step in
                                SummaryCard(isComplete: false, step: "Step \(step)")
                            }
                        }
                    }
                }
            }
            .padding()
            
            NavigationLink("Finish") {
                MainTabView()
            }
            .font(.title)
            .bold()
            .modifier(PrimaryButtonModifier())
            .disabled(!appViewModel.areAllStepsCompleted)
            .foregroundColor(appViewModel.areAllStepsCompleted ? .white : .unitPrimaryBackground)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
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

#Preview {
    TritonSummaryView(appViewModel: AppViewModel())
}
