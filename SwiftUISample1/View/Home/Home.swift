//
//  Home.swift
//  SwiftUISample1
//
//  Created by 鈴木楓香 on 2023/09/12.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView {
            VStack {
                NumberOfSteps()
                    .padding()
                    .frame(height: 300)
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // MEMO: お知らせ画面への遷移
                    } label: {
                        Label("menu", systemImage: "bell")
                            .foregroundColor(.black)
                            .scaleEffect(1.2)
                    }
                }
            }
            .padding(.top, 10)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
