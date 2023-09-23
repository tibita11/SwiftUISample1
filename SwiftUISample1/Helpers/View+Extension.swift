//
//  View+Extension.swift
//  SwiftUISample1
//
//  Created by 鈴木楓香 on 2023/09/23.
//

import SwiftUI

extension View {
    func isSameDate(_ date1: Date, _ date2: Date) -> Bool {
        return Calendar.current.isDate(date1, inSameDayAs: date2)
    }
}
