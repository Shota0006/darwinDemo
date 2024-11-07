//
//  SimpleLableView.swift
//  DarwinDemo
//
//  Created by Shota Iwamoto on 2024-11-01.
//

import SwiftUI

struct SimpleLableView: View {
    let text: String
    let labelColor: Color
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.bold)
            .padding(.vertical, 6)
            .padding(.horizontal, 22)
            .background(labelColor)
            .clipShape(.capsule)
    }
}

#Preview {
    SimpleLableView(text: "SOLAR", labelColor: Color("PrimaryAccent"))
}
