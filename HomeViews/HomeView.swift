//
//  HomeView.swift
//  DarwinDemo
//
//  Created by Shota Iwamoto on 2024-10-30.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack(alignment: .top){
            Color("PrimaryBackground").edgesIgnoringSafeArea(.all)
            VStack {
                BatteryAndSavingView()
                    .padding(.bottom, 12)
                HomeEnergyFlowCardView()
            }
            .padding(20)
        }
    }
}

#Preview {
    HomeView()
}
