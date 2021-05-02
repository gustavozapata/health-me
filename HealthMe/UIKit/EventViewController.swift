//
//  EventViewController.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 12/04/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import SwiftUI
import EventKit
import EventKitUI

let eventStore = EKEventStore()

// request access to the Calendar app, on allow access, create the event
func checkCalendarAuthorizationStatus(booking: BookingModel) {
    eventStore.requestAccess(to: .event, completion:{(granted: Bool, error: Error?) -> Void in
        if granted {
            insertEvent(store: eventStore, booking: booking)
        } else {
            print("Access denied")
        }
    })
}

// create and insert the event
func insertEvent(store: EKEventStore, booking: BookingModel) {
    let calendars = store.calendars(for: .event)
    
    for calendar in calendars {
        if calendar.title == "Calendar" {
            let startDate = booking.date
            let endDate = startDate.addingTimeInterval(2 * 30 * 30)
            
            let event = EKEvent(eventStore: store)
            event.calendar = calendar
            
            event.title = "Blood test appointment at \(booking.location) blood station"
            event.notes = "Address: \(booking.address)"
            event.startDate = startDate
            event.endDate = endDate
            
            do {
                try store.save(event, span: .thisEvent)
                openCalendarApp(date: event.startDate)
            } catch {
                print("Error saving event in calendar")
            }
        }
    }
}

//open the calendar app
func openCalendarApp(date: Date) {
    let interval = date.timeIntervalSinceReferenceDate
    let url = NSURL(string: "calshow:\(interval)")!
    DispatchQueue.main.async {
        UIApplication.shared.open(url as URL)
    }
}

