//
//  DateAppointment.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 07/03/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import Foundation

struct DateAppointment: Hashable {
    var day: Int
    var weekDay: String
    var month: String
    var fulldate: String
    
    init(day: Int, weekDay: String, month: String, fulldate: String) {
        self.day = day
        self.weekDay = weekDay
        self.month = month
        self.fulldate = fulldate
    }
}

func populateDates() -> [DateAppointment] {
    var dates = [DateAppointment]()
    var date = Date() //today's date
    let endString = Calendar.current.date(byAdding: .day, value: 30, to: date) //end date
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let endDate = dateFormatter.date(from: dateFormatter.string(from: endString!))
    
    let dateToSring = DateFormatter()
    
    //generate dates from today's date until end date
    while date <= endDate! {
        let calendar = Calendar.current.dateComponents([.year, .day, .hour], from: date)
        
        dateToSring.dateFormat = "EEEE" //Monday
        let dia = String(dateToSring.string(from: date).prefix(3))
        
        dateToSring.dateFormat = "LLLL" //March
        let mes = String(dateToSring.string(from: date).prefix(3))
        
        dateToSring.dateFormat = "EEEE, MMMM dd, yyyy" //Monday, March 08, 2021
        let fulldate = String(dateToSring.string(from: date))
        
        dates.append(DateAppointment(day: calendar.day!, weekDay: dia, month: mes, fulldate: fulldate))
        date = Calendar.current.date(byAdding: .day, value: 1, to: date)!
    }
    return dates
}
