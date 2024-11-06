//
//  HomeEnergyItem.swift
//  DarwinDemo
//
//  Created by Shota Iwamoto on 2024-11-05.
//

import SwiftUI

struct HomeEnergyItem: View {
    let type: HomeEnergyType
    let value: Double
    
    var body: some View {
        HStack {
            Image(systemName: type.icon)
                .resizable()
                .frame(width: 20, height: 18)
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
            .padding(.trailing, 40)
        }
        .padding(20)
        .background(Color("SecondaryBackground"))
        .cornerRadius(32)
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
    HomeEnergyItem(type: .consumption, value: 9.7)
    HomeEnergyItem(type: .solar, value: 5.7)
    HomeEnergyItem(type: .battery, value: -1.3)
    HomeEnergyItem(type: .grid, value: 0.3)
    HomeEnergyItem(type: .generator, value: 11.2)
}
