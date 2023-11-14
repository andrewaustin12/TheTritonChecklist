//
//  MainTabView.swift
//  TheTritonChecklist
//
//  Created by andrew austin on 11/14/23.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            Text("Build")
                .onAppear{
                    selectedIndex = 0
                }
                .tabItem{
                    Image(systemName: "water.waves")
                    Text("Build")
                }.tag(0)
            
            Text("GearList")
                .onAppear{
                    selectedIndex = 1
                }
                .tabItem{
                    Image(systemName: "list.dash")
                    Text("Gear")
                }.tag(1)
            SettingsView()
                .onAppear{
                    selectedIndex = 2
                }
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
                }.tag(2)
        }
        .navigationBarBackButtonHidden(true)
//        .accentColor(.unitPrimaryForeground)
    }
}


#Preview {
    MainTabView()
}
