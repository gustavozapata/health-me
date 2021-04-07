//
//  TimePicker.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 23/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct TimePicker: View {
    
    @ObservedObject var account: AccountViewModel = .account
    
    @Binding var isSelected: Bool
    @Binding var timeSelected: Int
    @Binding var bookings: [BookingModel]
    
    var date = Date()
    @State var currentTime = 0
    @State var currentDate = Date()
    
    var times = ["09:00", "09:30", "10:00", "10:30","11:00","11:30","12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30", "16:00","16:30","17:00","17:30", "18:00", "18:30"]
    
    var body: some View {
        VStack {
            renderRow(num: 0)
            renderRow(num: 4)
            renderRow(num: 8)
            renderRow(num: 12)
        }.padding(10).overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(red: 226/255, green: 232/255, blue: 240/255), lineWidth: 2)
        ).font(.system(size: 16, weight: .medium))
        .onAppear(){
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "HH:mm"
            let timeString = timeFormatter.string(from: date)
            currentTime = Int(timeString.prefix(2))!
        }
    }
    
    func renderRow(num: Int) -> some View {
        return HStack(alignment: .center, spacing: 15) {
            ForEach(num..<num+4){ i in
                Text(self.times[i]).padding(5).background(self.timeSelected == i ? Color.green : Color.white).foregroundColor(self.timeSelected == i ? Color.white : self.checkTimeSlot(time: self.times[i]) ? Color.primary : Color.gray).cornerRadius(6).onTapGesture {
                    if self.checkTimeSlot(time: self.times[i]) {
                        account.aBooking.time = String(self.times[i])
                        self.timeSelected = i
                        self.isSelected = true
                    }
                }
            }
        }.padding()
    }
    
    func checkTimeSlot(time: String) -> Bool {
        let dateToSring = DateFormatter()
        dateToSring.dateFormat = "EEEE, MMMM dd, yyyy"
        let chosenFulldate = String(dateToSring.string(from: account.aBooking.date))
        
        // if current time is greater than 4pm (latest appointment), then time not available
        if currentTime >= 16 {
            return false
        }
        // if it's earlier than current day and time, then time not available
        let selectFulldate = String(dateToSring.string(from: account.aBooking.date))
        let currentFulldate = String(dateToSring.string(from: currentDate))
        if selectFulldate == currentFulldate && dateToTimeInt(time).hour <= currentTime {
            return false
        }
        // check if times are already booked or not for that date and blood station
        for index in 0..<bookings.count {
            let bookingFulldate = String(dateToSring.string(from: bookings[index].date))
            if bookings[index].location == account.aBooking.location && bookingFulldate == chosenFulldate && time == bookings[index].time {
                return false
            }
        }
        return true
    }
}

struct TimePicker_Previews: PreviewProvider {
    static var previews: some View {
        TimePicker(isSelected: .constant(false), timeSelected: .constant(0), bookings: .constant([BookingModel(location: "", address: "", date: Date(), time: "")]))
    }
}
