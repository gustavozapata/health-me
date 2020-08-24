//
//  DatePicker.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 23/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct DatePicker: View {
    
    var dates = [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
    var dates2 = [15: true, 16: true, 17: false, 18: true, 19: false, 20: true, 21: true, 22: true, 23: false, 24: false, 25: true, 26: true, 27: false, 28: true, 29: true, 30: true]
    
    @State var dateSelected = -1
    @Binding var isSelected: Bool
    
    @ViewBuilder
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            Image(systemName: "chevron.left").padding(.trailing, 8).font(.system(size: 20, weight: .semibold))
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    ForEach(dates, id: \.self) { date in
                        DateSelect(date: date, selectedDate: self.$dateSelected, isSelected: self.$isSelected)
                    }
                }
            }.frame(width: 267)
            Image(systemName: "chevron.right").padding(.leading, 8).font(.system(size: 20, weight: .semibold))
        }
    }
}

struct DatePicker_Previews: PreviewProvider {
    static var previews: some View {
        DatePicker(isSelected: .constant(false))
    }
}
