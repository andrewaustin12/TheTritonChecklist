//
//  SummaryGasCard.swift
//  TheTritonChecklist
//
//  Created by andrew austin on 11/16/23.
//

import SwiftUI

struct SummaryOxygenCylinderCard: View {
    
    var title: String
    var o2Content: String
    var o2Pressure: String
    var cmfFlow: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
            HStack{
                Spacer()
                VStack{
                    Text("Oxygen:")
                        .font(.headline)
                    Text("\(o2Content) %")
                        
                }
                Spacer()
                VStack{
                    Text("Pressure:")
                        .font(.headline)
                    Text("\(o2Pressure) Bar")
                        
                }
                Spacer()
                VStack{
                    Text("CMF Flow:")
                        .font(.headline)
                    Text("\(cmfFlow) Sec")
                        
                }
                Spacer()
                
            }
        }
        .padding()
    }
}

#Preview {
    SummaryOxygenCylinderCard(title: "Oxygen Cylinder", o2Content: "99", o2Pressure: "200", cmfFlow: "9")
}

