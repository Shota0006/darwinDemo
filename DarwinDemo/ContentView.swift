//
//  ContentView.swift
//  DarwinDemo
//
//  Created by Shota Iwamoto on 2024-10-30.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab: Int = 0
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 0) {
                HStack{
                    VStack{
                        Text("Ecobee")
                            .font(.title)
                            .foregroundColor(.white)
                        Text("by Generac")
                            .foregroundColor(.white)
                    }
                    Spacer()
                    HStack {
                        Button(action: {
                            print("onPress UserIcon")
                        }) {
                            Image(systemName: "person.crop.circle.fill")
                                .foregroundColor(.green)
                                .font(.system(size: 40, weight: .bold))
                        }
                        Button(action: {
                            print("onPress PlusIcon")
                        }) {
                            Image(systemName: "plus.circle")
                                .foregroundColor(.green)
                                .font(.system(size: 40, weight: .thin))
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .background(Color("PrimaryBackground"))
                
                TabBarView(currentTab: self.$currentTab)
                
                TabView(selection: self.$currentTab){
                    HomeView().tag(0)
                    DevicesView().tag(1)
                }
            }
        }
    }
}

struct TabBarView: View {
    @Binding var currentTab: Int
    var tabBarOptions: [String] = ["Overview", "Devices"]
    
    var body: some View {
        ZStack {
            Color("PrimaryBackground").ignoresSafeArea(.all).frame(height: 60)
            HStack(spacing:0) {
                ForEach(Array(zip(self.tabBarOptions.indices, self.tabBarOptions)), id: \.0, content: {
                    index, name in
                    if index == 1 {
                        TabBarItem(currentTab: self.$currentTab, tabBarItemName: name, tab: index)
                    } else {
                        TabBarItem(currentTab: self.$currentTab, tabBarItemName: name, tab: index)
                        Spacer()
                    }
                    
                })
            }
            .background(Color("SecondaryBackground"))
            .cornerRadius(40)
            .animation(.linear, value: currentTab)
            .padding(.horizontal)
        }
    }
}

struct TabBarItem: View {
    @Binding var currentTab: Int
    
    var tabBarItemName: String
    var tab: Int
    
    var body: some View {
        Button (action: {
            self.currentTab = tab
        }) {
            VStack {
                Text(tabBarItemName)
                    .font(.system(size: 18))
                    .bold()
                    .foregroundColor(self.currentTab == tab ? Color.black: Color.white)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .padding(12)
        .frame(width: (UIScreen.main.bounds.width - 28) / 2)
        .background(self.currentTab == tab ? Color.white: nil)
        .cornerRadius(20)
    }
}

#Preview {
    ContentView()
}
