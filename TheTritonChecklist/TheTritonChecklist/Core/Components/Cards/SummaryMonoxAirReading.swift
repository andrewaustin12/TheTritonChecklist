//
//  SummaryCellAirView.swift
//  TheTritonChecklist
//
//  Created by andrew austin on 11/16/23.
//

import SwiftUI

struct SummaryMonoxAirReading: View {

    var title: String
    var cell1: String
    var cell2: String
    var cell3: String
    var volts: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
            HStack{
                VStack {
                    Text("Battery")
                        .font(.headline)
                    Text("\(volts) V")
                }
                Spacer()
                VStack{
                    Text("Cell 1")
                        .font(.headline)
                    Text("\(cell1) %")
                }
                Spacer()
                VStack{
                    Text("Cell 2")
                        .font(.headline)
                    Text("\(cell2) %")
                }
                Spacer()
                VStack{
                    Text("Cell 3")
                        .font(.headline)
                    Text("\(cell2) %")
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    SummaryMonoxAirReading(title: "Monox/Computer Readings:", cell1: "21", cell2: "21", cell3: "21", volts: "1.45")
}
