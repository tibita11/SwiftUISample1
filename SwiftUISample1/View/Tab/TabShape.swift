//
//  TabShape.swift
//  SwiftUISample1
//
//  Created by 鈴木楓香 on 2023/09/12.
//

import SwiftUI

// MEMO: Shapeプロトコルに準拠しているため、path(in:)を実装する必要がある
struct TabShape: Shape {
    var midpoint: CGFloat
    
    // MEMO: Shapeプロトコルに準拠する場合に、アニメーション可能なデータを定義する
    // MEMO: このデータに基づいて、アニメーションの中間状態を計算する
    var animatableData: CGFloat {
        get { midpoint }
        set {
            midpoint = newValue
        }
    }
    
    // MEMO: 与えられたrectの境界内での形状のPathを返す必要がある
    func path(in rect: CGRect) -> Path {
        // MEMO: 新しいPathを用意し、この中で与えられたrectの境界内での形状を定義する
        return Path { path in
            // MEMO: addPathで、Rectangleの図形を追加する
            path.addPath(Rectangle().path(in: rect))
            
            // MEMO: Rectangleとは別に起点を作成する
            path.move(to: .init(x: midpoint - 60, y: 0))
            
            let to = CGPoint(x: midpoint, y: -25)
            let control1 = CGPoint(x: midpoint - 25, y: 0)
            let control2 = CGPoint(x: midpoint - 25, y: -25)
            
            // MEMO: toを終点とした曲線を描く
            path.addCurve(to: to, control1: control1, control2: control2)
            
            let to1 = CGPoint(x: midpoint + 60, y: 0)
            let control3 = CGPoint(x: midpoint + 25, y: -25)
            let control4 = CGPoint(x: midpoint + 25, y: 0)
            
            // MEMO: toを終点とした曲線を描く
            path.addCurve(to: to1, control1: control3, control2: control4)
        }
    }
}
