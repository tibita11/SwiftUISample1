//
//  StepsData.swift
//  SwiftUISample1
//
//  Created by 鈴木楓香 on 2023/09/13.
//

import Foundation
import Charts

// MEMO: 歩数データを取得して配列で返す
struct StepsData: Identifiable {
    let id = UUID()
    let date: Date
    let steps: Int
    var animate: Bool = false
}

// MEMO: テスト用のデータ
var stepsTestData: [StepsData] = {
    let calendar = Calendar.current
    // MEMO: 1日分ずれる
    let date = Date()
    var data: [StepsData] = []
    for num in 0...13 {
        print(calendar.date(byAdding: .day, value: -num, to: date)!)
        data.append(StepsData(
            date: calendar.date(byAdding: .day, value: -num, to: date)!,
            steps: num%2 == 0 ? 1000 : 5000)
        )
    }
    return data
}()
