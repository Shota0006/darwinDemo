//
//  HomeEnergyItemView.swift
//  DarwinDemo
//
//  Created by Shota Iwamoto on 2024-11-05.
//

import SwiftUI

struct HomeEnergyItemView: View {
    let type: HomeEnergyType
    let value: Double
    
    @State var isExpanded: Bool = false
    
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: type.icon)
                    .resizable()
                    .frame(width: 18, height: 18)
                    .padding(8)
                    .background(Circle().fill(Color(type.iconColor)))
                    .clipShape(Circle())
                    .foregroundColor(.black)
                VStack(alignment: .leading){
                    Text(type.title)
                        .foregroundColor(.white)
                        .font(.title3)
                    Text(type.description)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                HStack(spacing: 4){
                    Text(String(String(format: "%.1f", value)))
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                    Text("kW")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                }
                if(type == .solar || type == .battery) {
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundStyle(.white)
                        .frame(width: 24)
                } else {
                    Spacer().frame(width: 30)
                }
                
                
            }
            
            if(isExpanded) {
                
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(0 ... 2, id: \.self) { index in
                        HStack{
                            Text("PV Link \(index + 1)")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text("(2 min ago)")
                        }
                        HStack {
                            Text("Making Power")
                            Text(" | ")
                            Text("19.2° C")
                            Text(" | ")
                            Text("Lifetime: ")
                            Text("3.2 MWh")
                        }
                        if index != 2 {
                            Rectangle()
                                .fill(.gray)
                                .frame(height: 1)
                                .padding(.vertical, 12)
                        }
                    }
                }
                .font(.caption)
                .foregroundStyle(.white)
                .padding(.vertical, 10)
            }
        }
        .padding(20)
        .background(Color("SecondaryBackground"))
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .onTapGesture {
            if(type == .solar || type == .battery) {
                withAnimation(.default) {
                    isExpanded.toggle()
                }
            }
        }
        
        
    }
}

enum HomeEnergyType: String {
    case consumption = "Consumption"
    case solar = "Solar"
    case battery = "Battery"
    case grid = "Grid"
    case generator = "Generator"
    
    var icon: String {
        switch self {
        case .consumption:
            return "house"
        case .solar:
            return "sun.max.fill"
        case .battery:
            return "battery.100percent.bolt"
        case .grid:
            return "power"
        case .generator:
            return "bolt.square"
        }
    }
    
    var iconColor: String {
        switch self {
        case .consumption:
            return "HomeColor"
        case .solar:
            return "SolorColor"
        case .battery:
            return "BatteryColor"
        case .grid:
            return "GridColor"
        case .generator:
            return "GeneratorColor"
        }
    }
    
    var title: String {
        switch self {
        case .consumption:
            return "Home"
        case .solar:
            return "Solar"
        case .battery:
            return "Battery"
        case .grid:
            return "Grid"
        case .generator:
            return "Generator"
        }
    }
    
    var description: String {
        switch self {
        case .consumption:
            return "Consuming"
        case .solar:
            return "Maiking power"
        case .battery:
            return "Consuming"
        case .grid:
            return "Exporting"
        case .generator:
            return "Ready to run"
        }
    }
}

#Preview() {
    HomeEnergyItemView(type: .consumption, value: 9.7)
    HomeEnergyItemView(type: .solar, value: 5.7)
    HomeEnergyItemView(type: .battery, value: -1.3)
    HomeEnergyItemView(type: .grid, value: 0.3)
    HomeEnergyItemView(type: .generator, value: 11.2)
}
