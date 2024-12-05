//
//  DevicesView.swift
//  DarwinDemo
//
//  Created by Shota Iwamoto on 2024-10-30.
//

import SwiftUI

struct DevicesView: View {
    var body: some View {
        ZStack {
            Color("PrimaryBackground").edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 16) {
                    // My ecobee card
                    VStack{
                        HStack {
                            Image(systemName: "earbuds.case")
                            Text("My ecobee")
                                .font(.title3)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.subheadline)
                        }
                        .foregroundStyle(.white)
                        .padding(.bottom, 24)
                        .onTapGesture {
                            print("on My ecobee")
                        }
                        
                        HStack(spacing: 12) {
                            HStack{
                                Image(systemName: "drop")
                                Text("40%")
                                    .font(.callout)
                                    .fontWeight(.semibold)
                            }
                            HStack{
                                Image(systemName: "snowflake")
                                Text("Cool")
                                    .font(.callout)
                                    .fontWeight(.semibold)
                            }
                        }
                        .foregroundStyle(.white)
                        
                        Text("22")
                            .padding(6)
                            .font(.system(size: 72, weight: .medium))
                            .foregroundStyle(.white)
                        
                        Text("72")
                            .padding(.horizontal, 32)
                            .padding(.vertical, 10)
                            .overlay(Capsule().stroke(.blue, lineWidth: 2))
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.blue)
                        
                    }
                    .padding(28)
                    .background(Color("SecondaryBackground"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    
                    HomeEnergyItemView(type: .solar, value: 5.2)
                    HomeEnergyItemView(type: .battery, value: -1.3)
                    
                    Spacer()
                }
                .padding(20)
                
            }
        }
    }
    
}

#Preview {
    DevicesView()
}
