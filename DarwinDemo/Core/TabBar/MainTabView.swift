//
//  MainTabView.swift
//  DarwinDemo
//
//  Created by Shota Iwamoto on 2024-11-07.
//

import SwiftUI

struct MainTabView: View {
    @State var selectedTab = 0
    
    init() {
        if let backgroundColor = UIColor(named: "PrimaryBackground") {
            UITabBar.appearance().backgroundColor = backgroundColor
            UITabBar.appearance().unselectedItemTintColor = UIColor.white
            UITabBar.appearance().tintColor = UIColor.systemGreen
        }
    }

    var body: some View {
        NavigationStack {
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
}

#Preview {
    MainTabView()
}
