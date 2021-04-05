//
//  AppointmentCard.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 23/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct AppointmentCard: View {
    
    @ObservedObject var account: AccountViewModel = .account
    @State var showMap = false
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(account.aBooking.location).fontWeight(.bold)
                    Text(account.aBooking.address)
                }.padding(.trailing)
                VStack {
                    Image("map_icon").resizable().aspectRatio(contentMode: .fit).frame(width: 24)
                    Button(action: {
                        self.showMap.toggle()
                    }) {
                        Text("See map").font(.system(size: 14)).underline().foregroundColor(Color.primary)
                    }.sheet(isPresented: $showMap){
                        MapView()
                    }
                }
            }.padding(.bottom, 20)
            HStack {
                Image(systemName: "calendar").resizable().aspectRatio(contentMode: .fit).frame(width: 45)
                VStack(alignment: .leading, spacing: 5) {
                    Text(dateToString(date: account.aBooking.date, format: "text"))
                    Text(account.aBooking.time)
                }
            }
        }.padding().background(Color(red:245/255, green: 247/255, blue: 250/255)).cornerRadius(22).clipped().shadow(color: Color(red: 200/255, green: 200/255, blue: 200/255), radius: 7, x: 0, y: 2).frame(width: 320)
    }
}

struct AppointmentCard_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentCard()
    }
}
