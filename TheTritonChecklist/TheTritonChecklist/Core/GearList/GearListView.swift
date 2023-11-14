//
//  GearListView.swift
//  TheTritonChecklist
//
//  Created by andrew austin on 11/14/23.
//

import SwiftUI
import SwiftData

struct GearListView: View {
    @State private var sheetIsPresented = false
    @Query var toDos: [ToDo]
    @Environment(\.modelContext) var modelContext
    
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                
                List {
                    Section {
                        ForEach(toDos) { toDo in
                            HStack {
                                Image(systemName: toDo.isCompleted ? "checkmark.rectangle" : "rectangle")
                                    .onTapGesture {
                                        toDo.isCompleted.toggle()
                                    }
                                
                                NavigationLink {
                                    DetailView(toDo: toDo)
                                } label: {
                                    Text(toDo.item)
                                }
                            }
                            .font(.title2)
                            .swipeActions{
                                Button("Delete", role: .destructive) {
                                    modelContext.delete(toDo)
                                }
                            }
                        }
                    } header: {
                        Text("Gear List")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.unitPrimaryForeground)
                    }
                    
                }
                
                Button {
                    sheetIsPresented.toggle()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundColor(.unitPrimaryForeground)
                        .accentColor(.white)
                        .frame(width: 60, height: 60)
                        .padding()
                }
                .clipShape(Circle())
                .padding()
                .sheet(isPresented: $sheetIsPresented) {
                    NavigationStack {
                        DetailView(toDo: ToDo()) // new value
                    }
                }
            }
        }
    }
}

#Preview {
    GearListView()
}
