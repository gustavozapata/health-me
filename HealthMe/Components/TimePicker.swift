//
//  TimePicker.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 23/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct TimePicker: View {
    
    @State var timeSelected = -1
    @Binding var isSelected: Bool
    
    var bookings = BookingsData()
    var times = ["9:00", "9:30", "10:00", "10:30","11:00","11:30","12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30", "16:00","16:30","17:00","17:30", "18:00", "18:30"]
    
    var body: some View {
        VStack {
            renderisar(num: 0)
            renderisar(num: 4)
            renderisar(num: 8)
            renderisar(num: 12)
            //renderisar(num: 16)
            
        }.padding().overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(red: 226/255, green: 232/255, blue: 240/255), lineWidth: 2)
        ).font(.system(size: 16, weight: .medium))
    }
    
    func checkTimeSlot(time: String) -> Bool {
        for index in 0..<bookings.bookings.count {
            if time == bookings.bookings[index].time {
                return true
            }
        }
        return false
    }
    
    func renderisar(num: Int) -> some View {
        return HStack(alignment: .center, spacing: 15) {
            ForEach(num..<num+4){ i in
                Text(self.times[i]).padding(5).background(self.timeSelected == i ? Color.green : Color.white).foregroundColor(self.timeSelected == i ? Color.white : self.checkTimeSlot(time: self.times[i]) ? Color.gray : Color.primary).cornerRadius(6).onTapGesture {
                    self.timeSelected = i
                    self.isSelected = true
                }
            }
        }.padding()
    }
}

struct TimePicker_Previews: PreviewProvider {
    static var previews: some View {
        TimePicker(isSelected: .constant(false))
    }
}
