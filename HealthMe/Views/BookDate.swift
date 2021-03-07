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
    var allBookings = [""]
    
    @State var dates = [DateAppointment]()
    @State var isDateSelected = true
    @State var isTimeSelected = false
    @State var timeSelected = -1
    @State var fulldateSelected = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    VStack {
                        Header(title: "Date & Time", subtitle: "Select a date and time")
                    }
                    VStack {
                        DatePicker(isSelected: $isDateSelected, timeSelected: $timeSelected, dates: $dates, fulldateSelected: $fulldateSelected)
                        Text(fulldateSelected).font(.system(size: 18, weight: .semibold)).padding(30)
                        TimePicker(isSelected: $isTimeSelected, timeSelected: $timeSelected)
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
            
            account.getBookingDates {
                ///TODO:
                //fulldateSelected = dates[0].fulldate
            }
        }
    }
}

struct BookDate_Previews: PreviewProvider {
    static var previews: some View {
        BookDate().environment(\.sizeCategory, .extraSmall)
    }
}
