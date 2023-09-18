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
                        .frame(height: 130)
                    
                    HStack(spacing: 20) {
                        Group {
                            HStack {
                                Spacer()
                                Button {
                                    //MEMO: 体重記録画面に遷移
                                    
                                } label: {
                                    VStack(spacing: 10) {
                                        Image(systemName: "scalemass")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                        
                                        Text("体重を記録する")
                                            .font(.caption)
                                    }
                                }
                                Spacer()
                            }
                            
                            HStack {
                                Spacer()
                                Button {
                                    //MEMO: 体重記録画面に遷移
                                    
                                } label: {
                                    VStack(spacing: 10) {
                                        Image(systemName: "applewatch.watchface")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                        
                                        Text("体重を記録する")
                                            .font(.caption)
                                    }
                                }
                                Spacer()
                            }
                        }
                        .padding(5)
                        .background(.white)
                        .foregroundColor(.black)
                        .frame(width: 150, height: 90)
                        .cornerRadius(8)
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
