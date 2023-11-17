//
//  SummaryCalibrationCard.swift
//  TheTritonChecklist
//
//  Created by andrew austin on 11/16/23.
//

import SwiftUI

struct SummaryCalibrationCard: View {
    
    var title: String
    var o2Calibration: String


    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
            HStack{
                Spacer()
                HStack{
                    Text("Oxygen:")
                        .font(.headline)
                    Text("\(o2Calibration) %")
                        
                }
                Spacer()
                
            }
        }
        .padding()
    }
}


#Preview {
    SummaryCalibrationCard(title: "Calibration", o2Calibration: "98")
}
