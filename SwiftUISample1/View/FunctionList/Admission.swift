//
//  Admission.swift
//  SwiftUISample1
//
//  Created by 鈴木楓香 on 2023/09/17.
//

import SwiftUI

struct Admission: View {
    let title: String
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Admission_Previews: PreviewProvider {
    static var previews: some View {
        Admission(title: "入会する")
    }
}
