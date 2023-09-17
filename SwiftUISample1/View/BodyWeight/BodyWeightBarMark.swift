//
//  BodyBarMark.swift
//  SwiftUISample1
//
//  Created by 鈴木楓香 on 2023/09/16.
//

import SwiftUI
import Charts

struct BodyWeightBarMark: View {
    @State private var bodyWightData = bodyWeightTestData
    
    var body: some View {
        Chart {
            ForEach(bodyWightData) { data in
                BarMark(
                    x: .value("Date", data.date),
                    y: .value("BodyWight", data.animate ? data.bodyWight : 0), width: 15
                )
                .foregroundStyle(.orange)
            }
            
            RuleMark(y: .value("Goal", 65.0))
                .foregroundStyle(Color("Gray"))
            // MEMO: lineCapは線の端丸み
            // MEMO: dashで配列を指定することで点線が引ける 線の長さ、間隔、線の長さ、間隔で指定する
            // MEMO: dashPhaseに指定した位置から点線がひかれる
                .lineStyle(StrokeStyle(lineWidth: 0.5, lineCap: .butt, lineJoin: .miter, dash: [10,10,10,10], dashPhase: 0))
                .annotation(position: .top, alignment: .leading) {
                    Text("目標: 65.0kg")
                        .font(.caption2)
                        .foregroundColor(Color("Gray"))
                }
        }
        .frame(height: 70)
        .padding()
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .onAppear {
            // MEMO: タブ変更時にアニメーションを実施する
            if bodyWightData.first!.animate {
                bodyWightData = bodyWeightTestData
            }
            
            for (index,_) in bodyWightData.enumerated() {
                withAnimation(.easeInOut(duration: 0.8).delay(Double(index) * 0.05)) {
                    bodyWightData[index].animate = true
                }
            }
        }
    }
}

struct BodyBarMark_Previews: PreviewProvider {
    static var previews: some View {
        BodyWeightBarMark()
    }
}
