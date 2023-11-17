//
//  SummaryDiluentCard.swift
//  TheTritonChecklist
//
//  Created by andrew austin on 11/16/23.
//

import SwiftUI

struct SummaryDiluentCard: View {
    
    var title: String
    var dilContent: String
    var dilPressure: String

    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
            HStack{
                Spacer()
                VStack{
                    Text("Oxygen:")
                        .font(.headline)
                    Text("\(dilContent) %")
                        
                }
                Spacer()
                VStack{
                    Text("Pressure:")
                        .font(.headline)
                    Text("\(dilPressure) Bar")
                        
                }
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    SummaryDiluentCard(title: "Diluent/Bailout Cylinder", dilContent: "21", dilPressure: "200")
}
