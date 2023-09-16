//
//  NumberOfSteps.swift
//  SwiftUISample1
//
//  Created by 鈴木楓香 on 2023/09/12.
//

import SwiftUI

struct NumberOfSteps: View {
    var body: some View {
        VStack(spacing: 5) {
            HStack(alignment: .center) {
                Spacer()
                
                Text("18:17")
                
                Button {
                    // MEMO: リロードする処理
                } label: {
                    Label("", systemImage: "arrow.clockwise")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text("歩数")
                        .font(.title3)
                    Text("1000歩")
                        .font(.title)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("消費カロリー: 600kcal")
                        .font(.caption)
                    Text("おにぎり4個分")
                        .font(.caption)
                }
            }
            
            StepsBarMark()
            
            Spacer()
        }
        .padding()
        .background(.white)
        .cornerRadius(8)
        .clipped()
        .shadow(color: .gray.opacity(0.7), radius: 5)
    }
}

struct NumberOfSteps_Previews: PreviewProvider {
    static var previews: some View {
        NumberOfSteps()
            .previewLayout(.sizeThatFits)
    }
}
