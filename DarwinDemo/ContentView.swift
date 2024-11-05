//
//  ContentView.swift
//  DarwinDemo
//
//  Created by Shota Iwamoto on 2024-10-30.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab = 0
    
    init() {
        if let backgroundColor = UIColor(named: "PrimaryBackground") {
            UITabBar.appearance().backgroundColor = backgroundColor
        }
        UITabBar.appearance().isTranslucent = false
    }
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            HomeView().tabItem{
                Image(systemName: "house")
                Text("Home")
            }.tag(0)
            ActivityView().tabItem {
                Image(systemName: "clock")
                Text("Activity")
            }.tag(1)
            ReportsView().tabItem {
                Image(systemName: "chart.bar.fill")
                Text("Reports")
            }.tag(2)
            DiscoveryView().tabItem {
                Image(systemName: "map")
                Text("Discovery")
            }.tag(3)
        }
    }
}

#Preview {
    ContentView()
}
