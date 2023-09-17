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
            ZStack(alignment: .top) {
                Rectangle()
                    .fill(Color("Yellow"))
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: 150)
                
                ScrollView {
                    VStack(spacing: 20) {
                        NumberOfSteps()
                        
                        BodyWeight()
                        
                        Spacer()
                    }
                    .padding(.top, 10)
                    .padding(.horizontal, 20)
                    
                    FunctionList()

                }
                .toolbarBackground(Color("Yellow"),for: .navigationBar)
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
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
