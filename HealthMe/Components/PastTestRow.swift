//
//  PastTestRow.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 18/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct PastTestRow: View {
    var pastTest: BookingModel
    var currentDate = Date()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("\(dateToString(date: pastTest.date, format: "text")) at \(pastTest.time)").font(.system(size: 16))
                Spacer()
                if pastTest.date > currentDate {
                    Text("Coming soon").font(.system(size: 13, weight: .semibold)).foregroundColor(.green)
                }
            }
            Text(pastTest.location).foregroundColor(.gray).font(.system(size: 15))
        }.padding(EdgeInsets(top: 18, leading: 0, bottom: 18, trailing: 0))
    }
}

struct PastTestRow_Previews: PreviewProvider {
    static var previews: some View {
        PastTestRow(pastTest: BookingModel(location: "", address: "", date: Date(), time: ""))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
