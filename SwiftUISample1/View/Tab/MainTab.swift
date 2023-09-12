//
//  Home.swift
//  SwiftUISample1
//
//  Created by 鈴木楓香 on 2023/09/12.
//

import SwiftUI

struct MainTab: View {
    @State private var activeTab: Tab = .home
    // MEMO: 座標計算をせずに、Viewを次の場所へと動かす
    @Namespace private var animation
    // MEMO: CustomTabBarの背景に使用する
    @State private var tabShapePosition: CGPoint = .zero
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack {
            TabView(selection: $activeTab) {
                Home()
                    .tag(Tab.home)
                
                Text("Record")
                    .tag(Tab.record)
                
                Text("Certificate")
                    .tag(Tab.certificate)
                
                Text("Challenge")
                    .tag(Tab.challenge)
                
                Text("Menu")
                    .tag(Tab.menu)
            }
            
            CustomTabBar()
        }
    }
    
    // MEMO: Custonm Tab Bar
    @ViewBuilder
    func CustomTabBar(_ tint: Color = Color("Yellow"), _ inactiveColor: Color = .yellow) -> some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) {
                TabItem(
                    tint: tint,
                    inactiveTint: inactiveColor,
                    tab: $0,
                    animation: animation,
                    activeTab: $activeTab,
                    position: $tabShapePosition
                )
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background {
            // MEMO: 自作した背景 Rectabgleの上に山がついてる感じ
            TabShape(midpoint: tabShapePosition.x)
                .fill(.white)
                .ignoresSafeArea()
                .shadow(color: tint.opacity(0.2), radius: 5, x: 0, y: -5)
                .blur(radius: 2)
                .padding(.top, 25)
        }
        // MEMO: Animation
        .animation(
            // MEMO: バネの動き
            .interactiveSpring(
                // MEMO: アニメーションの反応時間
                response: 0.6,
                // MEMO: バネのダンピング 0に近いほど強いバウンド
                dampingFraction: 0.7,
                // MEMO: 別のアニメーションへの遷移の滑らかさ 値が高いほど滑らか
                blendDuration: 0.7
            ),
            // MEMO: アニメーショントリガー
            value: activeTab)
    }
}

struct TabItem: View {
    var tint: Color
    var inactiveTint: Color
    var tab: Tab
    var animation: Namespace.ID
    // MEMO: 異なるView間でデータを共有する
    @Binding var activeTab: Tab
    @Binding var position: CGPoint
    
    @State private var tabPosition: CGPoint = .zero
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: tab.systemImage)
                .font(.title2)
                .foregroundColor(activeTab == tab ? .black : .gray)
                .frame(width: activeTab == tab ? 58 : 35,
                       height:  activeTab == tab ? 58 : 35)
                .background {
                    if activeTab == tab {
                        Circle()
                            .fill(tint.gradient)
                            // MEMO: 座標計算をせずに、Viewを次の場所へと動かす
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }
            
            Text(tab.rawValue)
                .font(.caption)
                .foregroundColor(activeTab == tab ? .black : .gray)
        }
        .frame(maxWidth: .infinity)
        // MEMO: タップジェスチャー範囲を広げる設定
        .contentShape(Rectangle())
        // MEMO: 自分のポシションを取得する
        .viewPosition(completion: { rect in
            // MEMO: Item全てが自分の位置を保持する
            tabPosition.x = rect.midX
            
            if activeTab == tab {
                // MEMO: アクティブタブの場合は、背景を動かす必要がある
                position.x = rect.midX
            }
        })
        // MEMO: タップ時に、タブに反映する
        .onTapGesture {
            activeTab = tab
            
            // MEMO: 保持している自分のポジションへ変更する
            withAnimation(
                .interactiveSpring(
                    response: 0.6,
                    dampingFraction: 0.7,
                    blendDuration: 0.7)) {
                position.x = tabPosition.x
            }
        }
    }
}

struct MainTab_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
