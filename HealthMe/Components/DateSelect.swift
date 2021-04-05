//
//  DateSelect.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 07/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct DateSelect: View {
    
    @ObservedObject var account: AccountViewModel = .account
    var date: DateAppointment
    @Binding var selectedDate: Int
    @Binding var isSelected: Bool
    @Binding var timeSelected: Int
    @Binding var fulldateSelected: String
    
    var bookings = BookingsData()
    var fullBooked = [Int]()
    
    var body: some View {
        VStack(alignment: .center, spacing: 2) {
            Text(date.month).font(.system(size: 12, weight: .bold)).padding(.top, 5)
            Text("\(date.day)").font(.system(size: 25, weight: .bold))
            Text(date.weekDay).font(.system(size: 15, weight: .bold)).padding(.bottom, 5)
        }.padding(.horizontal, 16).background(self.selectedDate == self.date.day ? Color.green : Color.white).foregroundColor(self.selectedDate == self.date.day ? Color.white : Color.black).border(Color.black).onTapGesture {
            self.selectedDate = self.date.day
            self.isSelected = true
            self.fulldateSelected = self.date.fulldate
            account.aBooking.date = self.date.date
            self.timeSelected = -1
        }
    }
}

struct DateSelect_Previews: PreviewProvider {
    static var previews: some View {
        DateSelect(date: DateAppointment(day: 9, weekDay: "Mon", month: "Oct", fulldate: "Monday, March 08, 2021", date: Date()), selectedDate: .constant(0), isSelected: .constant(false), timeSelected: .constant(0), fulldateSelected: .constant("Monday, March 08, 2021")).previewLayout(.fixed(width: 65, height: 65))
    }
}
