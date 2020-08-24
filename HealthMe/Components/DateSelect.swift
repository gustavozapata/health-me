//
//  DateSelect.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 07/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct DateSelect: View {
    
    var date: Int
    @Binding var selectedDate: Int
    @Binding var isSelected: Bool
    
    var bookings = BookingsData()
    var fullBooked = [Int]()
    
    var body: some View {
        VStack(alignment: .center, spacing: 2) {
            Text("Aug").font(.system(size: 12, weight: .bold)).padding(.top, 5)
            Text("\(date)").font(.system(size: 25, weight: .bold))
            Text("Fri").font(.system(size: 15, weight: .bold)).padding(.bottom, 5)
        }.padding(.horizontal, 16).background(self.selectedDate == self.date ? Color.green : Color.white).foregroundColor(self.selectedDate == self.date ? Color.white : checkDateSlot(date: date) ? Color.gray : Color.black).border(checkDateSlot(date: date) ? Color.gray : Color.black).onTapGesture {
            self.selectedDate = self.date
            self.isSelected = true
        }
    }
    
    func checkDateSlot(date: Int) -> Bool {
        for index in 0..<bookings.bookings.count {
            if date == bookings.bookings[index].day {
                return true
            }
        }
        return false
    }
}
struct DateSelect_Previews: PreviewProvider {
    static var previews: some View {
        DateSelect(date: 19, selectedDate: .constant(0), isSelected: .constant(false)).previewLayout(.fixed(width: 65, height: 65))
    }
}
