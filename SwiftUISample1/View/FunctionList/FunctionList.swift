//
//  FunctionList.swift
//  SwiftUISample1
//
//  Created by 鈴木楓香 on 2023/09/17.
//

import SwiftUI

struct FunctionList: View {
    private let grids = Array(repeating: GridItem(.fixed(80), alignment: .top), count: 4)
    private let functions: [(imageName: String, text: String)] = [
        ("square.and.pencil", "入会する"),
        ("timer", "ちょいトレ習慣"),
        ("figure.arms.open", "カラダ記録"),
        ("figure.run", "運動記録"),
        ("magnifyingglass", "店舗検索"),
        ("cart", "オンラインストア"),
        ("questionmark.circle", "FAQ"),
        ("chevron.right.circle", "すべて見る")
    ]
    
    var body: some View {
        LazyVGrid(columns: grids, spacing: 20) {
            ForEach(0..<functions.count, id: \.self) { num in
                NavigationLink {
                    Admission(title: functions[num].text)
                } label: {
                    FunctionItem(imageName: functions[num].imageName, text: functions[num].text)
                }
            }
        }
        .padding()
    }
}

struct FunctionItem: View {
    let imageName: String
    let text: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image(systemName: imageName)
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(.black)
            
            Text(text)
                .font(.caption)
                .foregroundColor(.black)
        }
    }
}

struct FunctionList_Previews: PreviewProvider {
    static var previews: some View {
        FunctionList()
            .previewLayout(.sizeThatFits)
    }
}
