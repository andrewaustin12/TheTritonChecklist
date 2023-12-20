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
    let maxWidthForIpad: CGFloat = 700
    
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
                            .font(.title)
                            .foregroundStyle(Color.unitPrimaryForeground)
                            .bold()
                    }
                    
                }
                
                Button {
                    sheetIsPresented.toggle()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .accentColor(Color.unitPrimaryForeground)
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
            .overlay {
                if toDos.isEmpty {
                    ContentUnavailableView(label: {
                        Label("No Gear", systemImage: "list.bullet.rectangle.portrait")
                    }, description: {
                        Text("Start adding items to see your list.")
                    })
                    .offset(y: -60)
                }
            }
        }
    }
}
#Preview {
    GearListView()
}
