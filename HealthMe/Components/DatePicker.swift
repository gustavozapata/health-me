//
//  DatePicker.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 23/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct DatePicker: View {
    
    @State var dateSelected = 0
    @Binding var isSelected: Bool
    @Binding var timeSelected: Int
    @Binding var dates: [DateAppointment]
    @Binding var fulldateSelected: String
    
    @ViewBuilder
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            Image(systemName: "chevron.left").padding(.trailing, 8).font(.system(size: 20, weight: .semibold))
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(dates, id: \.self) { date in
                        DateSelect(date: date, selectedDate: self.$dateSelected, isSelected: self.$isSelected, timeSelected: $timeSelected, fulldateSelected: $fulldateSelected)
                    }
                }
            }.frame(width: 267)
            Image(systemName: "chevron.right").padding(.leading, 8).font(.system(size: 20, weight: .semibold))
        }.onAppear(){
            dateSelected = dates[0].day
        }
    }
}

struct DatePicker_Previews: PreviewProvider {
    static var previews: some View {
        DatePicker(isSelected: .constant(false), timeSelected: .constant(0), dates: .constant([DateAppointment(day: 8, weekDay: "Monday", month: "March", fulldate: "Monday, March 08, 2021")]), fulldateSelected: .constant("Monday, March 08, 2021"))
    }
}
