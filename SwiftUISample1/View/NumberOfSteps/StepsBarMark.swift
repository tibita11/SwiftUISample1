//
//  StepsBarMark.swift
//  SwiftUISample1
//
//  Created by 鈴木楓香 on 2023/09/13.
//

import SwiftUI
import Charts

struct StepsBarMark: View {
    @State private var stepsData = stepsTestData
    
    var body: some View {
        Chart {
            ForEach(stepsData) { data in
                BarMark(
                    x: .value("Date", data.date),
                    y: .value("steps", data.animate ? data.steps : 0), width: 15
                )
                .foregroundStyle(.orange)
            }
            
            RuleMark(y: .value("Goal", 8300))
                .foregroundStyle(Color("Gray"))
            // MEMO: lineCapは線の端丸み
            // MEMO: dashで配列を指定することで点線が引ける 線の長さ、間隔、線の長さ、間隔で指定する
            // MEMO: dashPhaseに指定した位置から点線がひかれる
                .lineStyle(StrokeStyle(lineWidth: 0.5, lineCap: .butt, lineJoin: .miter, dash: [10,10,10,10], dashPhase: 0))
                .annotation(position: .top, alignment: .leading) {
                    Text("目標: 8300歩")
                        .font(.caption2)
                        .foregroundColor(Color("Gray"))
                }
            
            RuleMark(y: .value("Average", 5832))
                .foregroundStyle(Color("Gray"))
                .lineStyle(StrokeStyle(lineWidth: 0.5, lineCap: .butt, lineJoin: .miter, dash: [10,10,10,10], dashPhase: 0))
                .annotation(position: .top, alignment: .leading) {
                    Text("平均: 5832歩")
                        .font(.caption2)
                        .foregroundColor(Color("Gray"))
                }
        }
        .frame(height: 70)
        .padding()
        .chartYAxis(.hidden)
        .chartXAxis {
            // MEMO: AxisMarksを定義することでカスタマイズ可能になる
            AxisMarks(){
                // MEMO: Lableの表示をM/dで表示する
//                AxisValueLabel(format: .dateTime.day().month(.defaultDigits), centered: false)
            }
        }
        .onAppear {
            // MEMO: タブ変更時にアニメーションを実施する
            if stepsData.first!.animate {
                stepsData = stepsTestData
            }
            
            for (index,_) in stepsData.enumerated() {
                withAnimation(.easeInOut(duration: 0.8).delay(Double(index) * 0.05)) {
                    stepsData[index].animate = true
                }
            }
        }
    }
}

struct StepsBarMark_Previews: PreviewProvider {
    static var previews: some View {
        StepsBarMark()
    }
}
