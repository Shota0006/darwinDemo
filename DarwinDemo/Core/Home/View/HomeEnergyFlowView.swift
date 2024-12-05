//
//  HomeEnergyFlowView.swift
//  DarwinDemo
//
//  Created by Shota Iwamoto on 2024-11-05.
//

import SwiftUI

struct HomeEnergyFlowView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color("PrimaryBackground").edgesIgnoringSafeArea(.all)
            VStack(spacing: 0){
                // Header
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "multiply")
                            .foregroundColor(.green)
                            .font(.title)
                    }
                    Spacer()
                    Text("Home energy flow")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: {
                        print("Setting onPress")
                    }) {
                        Image(systemName: "gearshape")
                            .font(.title3)
                            .foregroundColor(.green)
                    }
                }
                .padding(.horizontal)
                .frame(height: 50)
                
                ScrollView {
                    // Top label section
                    HStack {
                        HStack {
                            Circle().fill(Color.green).frame(width: 10)
                            Text("Grid Connected").foregroundColor(.white)
                        }
                        .padding(.vertical, 4)
                        .padding(.horizontal, 12)
                        .background(Color("SecondaryBackground"))
                        .cornerRadius(32)
                        
                        HStack {
                            Circle().fill(Color.green).frame(width: 10)
                            Text("Clean Backup").foregroundColor(.white)
                        }
                        .padding(.vertical, 4)
                        .padding(.horizontal, 12)
                        .background(Color("SecondaryBackground"))
                        .clipShape(.capsule)
                    }
                    
                    // Hero Home Image
                    Image("HomeImg")
                        .resizable()
                        .scaledToFit()
                    
                    // Label
                    HStack {
                        SimpleLableView(text: "SOLOR", labelColor: .primaryAccent)
                        SimpleLableView(text: "GRID", labelColor: .secondaryAccent)
                    }
                    
                    Text("Solar powering your home, charging your battery and you are exporting any surplus enegy to the grid")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 16)
                        .padding(.horizontal, 30)
                    
                    // Energy Card
                    HomeEnergyItemView(type: .consumption, value: 9.7)
                    HomeEnergyItemView(type: .solar, value: 5.2)
                    HomeEnergyItemView(type: .battery, value: -1.3)
                    HomeEnergyItemView(type: .grid, value: 0.3)
                    
                    
                }
                .padding(.top, 12)
                .padding(.horizontal, 12)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    HomeEnergyFlowView()
}
