//
//  BodyWeightData.swift
//  SwiftUISample1
//
//  Created by 鈴木楓香 on 2023/09/16.
//

import Foundation

// MEMO: 体重データを取得して配列で返す
struct BodyWeightData: Identifiable {
    let id = UUID()
    let date: Date
    let bodyWight: Double
    var animate: Bool = false
}

// MEMO: テスト用のデータ
var bodyWeightTestData: [BodyWeightData] = {
    let calendar = Calendar.current
    let date = Date()
    var data: [BodyWeightData] = []
    for num in 0...13 {
        data.append(BodyWeightData(
            date: calendar.date(byAdding: .day, value: -num, to: date)!,
            bodyWight: num%2 == 0 ? 50.6 : 45.8)
        )
    }
    return data
}()
