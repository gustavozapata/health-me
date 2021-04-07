//
//  DateHandler.swift
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
    var date: Date
    
    init(day: Int, weekDay: String, month: String, fulldate: String, date: Date) {
        self.day = day
        self.weekDay = weekDay
        self.month = month
        self.fulldate = fulldate
        self.date = date
    }
}

func populateDates() -> [DateAppointment] {
    var dates = [DateAppointment]()
    var date = Date() //today's date
    let endString = Calendar.current.date(byAdding: .day, value: 30, to: date) //end date
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    let endDate = dateFormatter.date(from: dateFormatter.string(from: endString!))
    
    let dateToSring = DateFormatter()
    
    //generate dates from today's date until end date
    while date <= endDate! {
        let calendar = Calendar.current.dateComponents([.year, .day, .hour], from: date)
        
        dateToSring.dateFormat = "EEEE" //Monday
        let day = String(dateToSring.string(from: date).prefix(3)) //Mon
        
        dateToSring.dateFormat = "LLLL" //March
        let month = String(dateToSring.string(from: date).prefix(3)) //Mar
        
        dateToSring.dateFormat = "EEEE, MMMM dd, yyyy" //Monday, March 08, 2021
        let fulldate = String(dateToSring.string(from: date))
        
        dates.append(DateAppointment(day: calendar.day!, weekDay: day, month: month, fulldate: fulldate, date: date))
        date = Calendar.current.date(byAdding: .day, value: 1, to: date)!
    }
    return dates
}

func dateToString(date: Date, time: String = "", format: String) -> String {
    let theTime = dateToTimeInt(time)
    let formatter = DateFormatter()
    let date = Calendar.current.date(bySettingHour: theTime.hour, minute: theTime.minutes, second: 0, of: date)!
    formatter.dateFormat = format == "text" ? "MMMM dd, yyyy" : format == "time" ? "HH:mm E, d MMM y" : "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    return String(formatter.string(from: date))
}

// convert string to int (safely) and get the hour and minutes
func dateToTimeInt(_ s: String?) -> (hour: Int, minutes: Int) {
    var hour = 0
    var minutes = 0
    if let str: String = s, let i = Int(str.prefix(2)), let j = Int(str.suffix(2)) {
        hour = i
        minutes = j
    }
    return (hour, minutes)
}
