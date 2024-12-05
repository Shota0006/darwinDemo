//
//  BatteryAndSavingCardView.swift
//  DarwinDemo
//
//  Created by Shota Iwamoto on 2024-10-31.
//

import SwiftUI

struct BatteryAndSavingView: View {
    var body: some View {
        HStack {
            BatteryCardView()
            SavingCardView()
        }
    }
}

struct BatteryCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) { // 少し間隔を追加
            // ボタン：Battery Level と Chevron アイコン
            Button(action: {
                print("onPress UserIcon")
            }) {
                HStack(alignment: .center) {
                    Text("Battery Level")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .bold))
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            HStack(alignment: .top, spacing: 4) {
                Image(systemName: "bolt.fill")
                    .foregroundColor(.green)
                    .padding(.top, 8)
                    .font(.system(size: 20, weight: .bold))
                Text("88")
                    .font(.system(size: 36))
                    .foregroundColor(.green)
                    .padding(.top, 2)
                Text("%")
                    .font(.system(size: 16))
                    .foregroundColor(.green)
                    .padding(.top, 8)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("SecondaryBackground"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 5)
    }
}

struct SavingCardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                print("onPress UserIcon")
            }) {
                HStack(alignment: .center) {
                    Text("Saved Today")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .bold))
                }
                
            }
            HStack(alignment: .center, spacing: 8) {
                Image(systemName: "dollarsign")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .bold))
                    .padding(.bottom, 8)
                Text("7.65")
                    .font(.system(size: 36))
                    .foregroundColor(.white)
                    .padding(.top, 2)
            }
        }
        
        .padding()
        .background(Color("SecondaryBackground"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct BatteryAndSavingView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryAndSavingView()
    }
}
