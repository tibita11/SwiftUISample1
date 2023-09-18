//
//  BodyRecord.swift
//  SwiftUISample1
//
//  Created by 鈴木楓香 on 2023/09/18.
//

import SwiftUI

struct BodyRecord: View {
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("Yellow"))
                        .frame(width: .infinity, height: 100)
                    
                    HStack(spacing: 20) {
                        Group {
                            Button {
                                //MEMO: 体重記録画面に遷移
                                
                            } label: {
                                VStack {
                                    Image(systemName: "scalemass")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    
                                    Text("体重を記録する")
                                        .font(.caption2)
                                }
                            }
                            
                            Button {
                                //MEMO: 体重記録画面に遷移
                                
                            } label: {
                                VStack {
                                    Image(systemName: "applewatch.watchface")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    
                                    Text("体重を記録する")
                                        .font(.caption2)
                                }
                           }
                        }
                        .padding(5)
                        .background(.white)
                        .foregroundColor(.black)
                        .frame(width: 150, height: 70)
                    }
                }
                
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("カラダ記録")
        }
    }
}

struct BodyRecord_Previews: PreviewProvider {
    static var previews: some View {
        BodyRecord()
    }
}
