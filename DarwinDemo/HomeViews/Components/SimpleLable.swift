//
//  SimpleLable.swift
//  DarwinDemo
//
//  Created by Shota Iwamoto on 2024-11-01.
//

import SwiftUI

struct SimpleLable: View {
    let text: String
    let labelColor: Color
    
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 16, weight: .bold))
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 22)
        .background(labelColor)
        .cornerRadius(32)
    }
}

#Preview {
    SimpleLable(text: "SOLAR", labelColor: Color("PrimaryAccent"))
}
