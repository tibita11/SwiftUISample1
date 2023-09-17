//
//  NotificationList.swift
//  SwiftUISample1
//
//  Created by 鈴木楓香 on 2023/09/17.
//

import SwiftUI

struct NotificationList: View {
    let grids = [GridItem(.fixed(100))]
    let notifications = [
        Image("Notification"),
        Image("Notification"),
        Image("Notification"),
        Image("Notification"),
        Image("Notification")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("お知らせ")
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: grids) {
                    ForEach(0..<notifications.count, id: \.self) { num in
                        notifications[num]
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
            }
            .frame(height: 100)
        }
        .padding()
    }
}

struct NotificationList_Previews: PreviewProvider {
    static var previews: some View {
        NotificationList()
            .previewLayout(.sizeThatFits)
    }
}
