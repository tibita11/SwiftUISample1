//
//  Date+Extension.swift
//  SwiftUISample1
//
//  Created by 鈴木楓香 on 2023/09/23.
//

import Foundation

extension Date {
    func format(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
    
    func fetchWeek() -> [WeekDay] {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: self)
        
        var week: [WeekDay] = []
        // MEMO: startOfDayを含む週を取得する 開始日と終了日を返す
        let weekForDate = calendar.dateInterval(of: .weekOfMonth, for: startOfDay)
        guard let startOfWeek = weekForDate?.start else {
            return []
        }
        
        (0..<7).forEach { index in
            if let weekDay = calendar.date(
                byAdding: .day,
                value: index,
                to: startOfWeek
            ) {
                week.append(.init(date: weekDay))
            }
        }
        
        return week
    }
    
    // MEMO: 1週間後を取得する
    func createNextWeek() -> [WeekDay] {
        let calendar = Calendar.current
        let startOfLastDate = calendar.startOfDay(for: self)
        guard let nextDate = calendar.date(byAdding: .day, value: 1, to: startOfLastDate) else {
            return []
        }
        return nextDate.fetchWeek()
    }
    
    // MEMO: 1週間前を取得する
    func createPreviousWeek() -> [WeekDay] {
        let calendar = Calendar.current
        let startOfFirstDate = calendar.startOfDay(for: self)
        guard let previousDate = calendar.date(byAdding: .day, value: -1, to: startOfFirstDate) else {
            return []
        }
        return previousDate.fetchWeek()
    }
    
    struct WeekDay: Identifiable {
        var id: UUID = .init()
        var date: Date
    }
}
