//
//  BodyWeight.swift
//  SwiftUISample1
//
//  Created by 鈴木楓香 on 2023/09/12.
//

import SwiftUI

struct BodyWeight: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(alignment: .bottom, spacing: 30) {
                VStack(alignment: .leading) {
                    Text("体重")
                        .font(.title3)
                    Text("69.9kg")
                        .font(.title)
                }
                
               VStack(alignment: .leading) {
                    Text("体脂肪率: 20.8%")
                        .font(.caption)
                    Text("BMI: -")
                        .font(.caption)
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .padding()
        .padding(.top, 20)
        .background(.white)
        .cornerRadius(8)
        .clipped()
        .shadow(color: .gray.opacity(0.7), radius: 5)
    }
}

struct BodyWeight_Previews: PreviewProvider {
    static var previews: some View {
        BodyWeight()
            .previewLayout(.sizeThatFits)
    }
}
