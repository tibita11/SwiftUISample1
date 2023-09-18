//
//  Record.swift
//  SwiftUISample1
//
//  Created by 鈴木楓香 on 2023/09/17.
//

import SwiftUI

struct Record: View {
    @State private var isCalendarView = false
    @State private var selectedDate: Date = Date()
    
    var dateFormatter: DateFormatter {
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "M/d"
        return dateFomatter
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 50) {
                Button {
                    // MEMO: カレンダーを表示する
                    isCalendarView = true
                } label: {
                    Text(dateFormatter.string(from: selectedDate))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Image(systemName: "arrowtriangle.down.fill")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(.white)
                .cornerRadius(8)
                .shadow(color: .gray.opacity(0.7), radius: 5)
                .sheet(isPresented: $isCalendarView) {
                    RecordCalendarViewModal(isShow: $isCalendarView, selectedDate: $selectedDate)
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("運動の記録")
                    
                    Button {
                        // MEMO: 記録画面へ遷移
                    } label: {
                        Text("記録する")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(13)
                            .background(Color("Red"))
                            .cornerRadius(8)
                    }
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("カラダの記録")
                    
                    NavigationLink {
                        BodyRecord()
                    } label: {
                        Text("記録する")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(13)
                            .background(Color("Red"))
                            .cornerRadius(8)
                    }
                }
                
                Spacer()
            }
            .padding(40)
            .navigationTitle("記録")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct RecordCalendarViewModal: View {
    @Binding var isShow: Bool
    @Binding var selectedDate: Date
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button {
                isShow = false
            } label: {
                Image(systemName: "xmark")
            }
            .foregroundColor(.gray)
            .padding(.horizontal, 20)
            .padding(.top, 50)
            
            RecordCalendarView { dateComponents in
                guard let date = dateComponents.date else {
                    return
                }
                isShow = false
                selectedDate = date
            }
            .presentationDragIndicator(.visible)
            .presentationDetents([.medium, .large])
        }
        .padding()
    }
}

struct Record_Previews: PreviewProvider {
    static var previews: some View {
        Record()
    }
}
