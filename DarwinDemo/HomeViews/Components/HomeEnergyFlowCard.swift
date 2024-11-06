//
//  HomeEnergyFlowCard.swift
//  DarwinDemo
//
//  Created by Shota Iwamoto on 2024-11-01.
//

import SwiftUI

struct HomeEnergyFlowCardView: View {
    var body: some View {
        VStack{
            VStack {
                NavigationLink(destination: HomeEnergyFlowView()) {
                    HStack {
                        Text("Home energy flow")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                        
                        HStack(alignment: .center){
                            Circle().fill(Color.green)
                                .frame(width: 8)
                            Text("Now")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                        }.padding(.leading, 8)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .bold))
                    }
                }

                HStack {
                    SimpleLable(text: "SOLAR", labelColor: Color("PrimaryAccent"))
                    Spacer()
                }
                .padding(.top, 12)
                .padding(.bottom, 20)
                
                HStack {
                    HomeEnergyFlowCardIcon(label: "Home", iconName: "house", value: 2.90)
                    Spacer()
                    HomeEnergyFlowCardIcon(label: "Solar",iconName: "sun.max.fill", value: 6.63)
                    Spacer()
                    HomeEnergyFlowCardIcon(label: "Battery", iconName: "battery.100percent.bolt", value: -1.23)
                    Spacer()
                    HomeEnergyFlowCardIcon(label: "Grid", iconName: "power", value: -2.5)
                }
                .padding(.horizontal, 12)
                
            }
            .padding(24)
        }
        .frame(maxWidth: .infinity)
        .background(Color("SecondaryBackground"))
        .cornerRadius(20)
    }
}

struct HomeEnergyFlowCardIcon: View {
    let label: String
    let iconName: String
    let value: Float?
    
    var body: some View {
        VStack {
            Image(systemName: iconName)
                .foregroundColor(Color("PrimaryIcon"))
                .font(.system(size: 26))
                .padding(.bottom, 2)
            
            Text(label)
                .font(.system(size: 14))
                .foregroundColor(.white)
                .padding(.bottom, 2)
            HStack(alignment: .bottom, spacing: 4) {
                if let value = value {
                    Text(String(format: "%.2f", value))
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.white)
                } else {
                    Text("0.00")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                }
                Text("kW")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
            }
        }
    }
}



#Preview {
    HomeEnergyFlowCardView()
}
