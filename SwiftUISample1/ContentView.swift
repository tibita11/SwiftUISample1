//
//  ContentView.swift
//  SwiftUISample1
//
//  Created by 鈴木楓香 on 2023/09/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       Home()
            // MEMO: 明示的に明るい色に設定する
            .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
