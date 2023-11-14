//
//  TitleHeaderView.swift
//  TheTritonChecklist
//
//  Created by andrew austin on 11/14/23.
//

import SwiftUI

struct TitleHeaderView: View {
    let title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .bold()
                .padding(.leading)

            Text("TRITON CHECKLIST")
                .bold()
                .padding(.leading)
        }
    }
}

#Preview {
    TitleHeaderView(title: "Steps 1-2")
}
