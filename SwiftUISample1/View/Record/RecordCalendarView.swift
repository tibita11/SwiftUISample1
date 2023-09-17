//
//  RecordCalenderView.swift
//  SwiftUISample1
//
//  Created by 鈴木楓香 on 2023/09/17.
//

import SwiftUI

struct RecordCalendarView: UIViewRepresentable {
    let didSelectDate: (_ deteComponents: DateComponents) -> Void
    
    final public class Coordinator: NSObject, UICalendarSelectionSingleDateDelegate {
        var didSelectDate: (_ deteComponents: DateComponents) -> Void
        
        init(didSelectDate: @escaping (_: DateComponents) -> Void) {
            self.didSelectDate = didSelectDate
        }
        
        // MEMO: CalendarViewのDateがタップされた際の処理
        public func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
            guard let dateComponents else {
                return
            }
            didSelectDate(dateComponents)
        }
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(didSelectDate: didSelectDate)
    }
    
    // MEMO: UIKitのCalendarViewを使用して表示する
    func makeUIView(context: Context) -> some UIView {
        let selection = UICalendarSelectionSingleDate(delegate: context.coordinator)
        let calendarView = UICalendarView()
        calendarView.calendar = Calendar(identifier: .gregorian)
        calendarView.locale = Locale(identifier: "ja")
        calendarView.availableDateRange.end = Date()
        calendarView.selectionBehavior = selection
        return calendarView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct RecordCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        RecordCalendarView { dateComponents in
            guard let date = dateComponents.date else {
                return
            }
            print(date)
        }
    }
}
