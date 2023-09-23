//
//  OffsetKey.swift
//  SwiftUISample1
//
//  Created by 鈴木楓香 on 2023/09/23.
//

import SwiftUI 

// MEMO: WeekViewのminXを保持する
struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
