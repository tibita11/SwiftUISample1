//
//  Tab.swift
//  SwiftUISample1
//
//  Created by 鈴木楓香 on 2023/09/12.
//

import SwiftUI

// MEMO: CaseIterableを使用してallCasesを使用している
enum Tab: String, CaseIterable {
    case home = "Home"
    case record = "Record"
    case certificate = "Certificate"
    case challenge = "Challenge"
    case menu = "Menu"
    
    // MEMO: selfによって画像を返す
    var systemImage: String {
        switch self {
        case .home:
            return "house"
        case .record:
            return "plus"
        case .certificate:
            return "qrcode"
        case .challenge:
            return "flag.fill"
        case .menu:
            return "list.bullet"
        }
    }
    
    // MEMO: 全てのケースから自分のIndexを取得する
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}
