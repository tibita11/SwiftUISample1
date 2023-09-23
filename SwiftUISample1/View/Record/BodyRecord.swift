//
//  BodyRecord.swift
//  SwiftUISample1
//
//  Created by 鈴木楓香 on 2023/09/18.
//

import SwiftUI

struct BodyRecord: View {
    // MEMO: 前の画面で指定した日付を入れる
    @State var currentDate: Date
    @State private var weakSlider: [[Date.WeekDay]] = []
    @State private var currentWeekIndex = 1
    @State private var crreateWeek: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            ZStack {
                Rectangle()
                    .foregroundColor(Color("Yellow"))
                    .frame(height: 130)
                
                HStack(spacing: 20) {
                    Group {
                        HStack {
                            Spacer()
                            NavigationLink {
                                BodyWeightRecord()
                            } label: {
                                VStack(spacing: 10) {
                                    Image(systemName: "scalemass")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    
                                    Text("体重を記録する")
                                        .font(.caption)
                                }
                            }
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            Button {
                                //MEMO: 体重記録画面に遷移
                                
                            } label: {
                                VStack(spacing: 10) {
                                    Image(systemName: "applewatch.watchface")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    
                                    Text("血圧を記録する")
                                        .font(.caption)
                                }
                            }
                            Spacer()
                        }
                    }
                    .padding(5)
                    .background(.white)
                    .foregroundColor(.black)
                    .frame(width: 150, height: 90)
                    .cornerRadius(8)
                }
            }
            
            CurrendarView()
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("カラダ記録")
        .onAppear {
            if weakSlider.isEmpty {
                let currentWeek = currentDate.fetchWeek()
                
                if let firstDate = currentWeek.first?.date {
                    weakSlider.append(firstDate.createPreviousWeek())
                }
                
                weakSlider.append(currentWeek)
                
                if let lastDate = currentWeek.last?.date {
                    weakSlider.append(lastDate.createNextWeek())
                }
            }
        }
    }
    
    @ViewBuilder
    func CurrendarView() -> some View {
        VStack {
            HStack {
                Text(currentDate.format("YYYY/MM/dd"))
                    .font(.title)
                    .bold()
                
                Spacer()
                
                Button {
                    // MEMO: 月で選択できるようにする処理
                } label: {
                    HStack {
                        Image(systemName: "calendar")
                        Text("月の表示")
                    }
                    .padding(10)
                    .foregroundColor(.black)
                }
                .background(.white)
                .cornerRadius(15)
                .clipped()
                .shadow(color: .gray.opacity(0.7), radius: 5)
            }
            
            TabView(selection: $currentWeekIndex) {
                ForEach(weakSlider.indices, id: \.self) { index in
                    let week = weakSlider[index]
                    WeekView(week)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 90)
            .onChange(of: currentWeekIndex) { newValue in
                if newValue == 0 || newValue == weakSlider.count - 1 {
                    crreateWeek = true
                }
            }
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    func WeekView(_ week: [Date.WeekDay]) -> some View {
        HStack(spacing: 0) {
            ForEach(week) { day in
                VStack(spacing: 8) {
                    Text(day.date.format("E"))
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                    
                    Text(day.date.format("dd"))
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(isSameDate(currentDate, day.date) ? .black : .black)
                        .frame(width: 35, height: 35)
                        .background(content: {
                            if isSameDate(currentDate, day.date) {
                                Circle()
                                    .fill(Color("Yellow"))
                            }
                        })
                        .background(.white.shadow(.drop(radius: 1)), in: Circle())
                }
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    withAnimation() {
                        currentDate = day.date
                    }
                }
            }
        }
        .background {
            GeometryReader {
                let minX = $0.frame(in: .global).minX
                
                Color.clear
                    .preference(key: OffsetKey.self, value: minX)
                    .onPreferenceChange(OffsetKey.self) { value in
                        if value.rounded() == 20 && crreateWeek {
                            paginateWeek()
                            crreateWeek = false
                        }
                    }
            }
        }
    }
    
    func paginateWeek() {
        if weakSlider.indices.contains(currentWeekIndex) {
            if let firstDate = weakSlider[currentWeekIndex].first?.date,
               currentWeekIndex == 0 {
                weakSlider.insert(firstDate.createPreviousWeek(), at: 0)
                weakSlider.removeLast()
                currentWeekIndex = 1
            }
            
            if let lastDate = weakSlider[currentWeekIndex].last?.date,
               currentWeekIndex == weakSlider.count - 1 {
                weakSlider.append(lastDate.createNextWeek())
                weakSlider.removeFirst()
                currentWeekIndex = weakSlider.count - 2
            }
        }
    }
}

struct BodyRecord_Previews: PreviewProvider {
    static var previews: some View {
        BodyRecord(currentDate: Date())
    }
}
