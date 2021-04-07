//
//  BookDate.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 06/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct BookDate: View {
    
    @ObservedObject var account: AccountViewModel = .account
    
    @State var dates = [DateAppointment]()
    @State var bookings = [BookingModel]()
    @State var times = [] ///TODO: 
    @State var isDateSelected = true
    @State var isTimeSelected = false
    @State var timeSelected = -1
    @State var dateSelected = 0
    @State var fulldateSelected = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    VStack {
                        Header(title: "Date & Time", subtitle: "Select a date and time")
                    }
                    VStack {
                        DatePicker(dateSelected: $dateSelected, isSelected: $isDateSelected, timeSelected: $timeSelected, dates: $dates, fulldateSelected: $fulldateSelected)
                        Text(fulldateSelected).font(.system(size: 18, weight: .semibold)).padding(30)
                        TimePicker(isSelected: $isTimeSelected, timeSelected: $timeSelected, bookings: $bookings)
                    }.padding(.bottom, 30)
                }
            }.navigationBarTitle("Book Test")
            
            if isDateSelected && isTimeSelected && timeSelected != -1 {
                NavigationLink(destination: PaymentView()){
                    ConfirmButton()
                }
            }
        }.onAppear(){
            dates = populateDates()
            fulldateSelected = dates[0].fulldate
            account.aBooking.date = Date()
            account.getBookingDates {
                bookings = account.bookingModel!.bookings
            }
        }
    }
    
    func getTimes() {
        for index in 0..<bookings.count {
            if toInt(dateToString(date: bookings[index].date, format: "text")) == dateSelected {
                self.times.append(bookings[index].time)
            }
        }
    }
    
    func toInt(_ s: String?) -> Int {
        var result = 0
        if let str: String = s, let i = Int(str.prefix(2)) {
            result = i
        }
        return result
    }
}

struct BookDate_Previews: PreviewProvider {
    static var previews: some View {
        BookDate().environment(\.sizeCategory, .extraSmall)
    }
}
