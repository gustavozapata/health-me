//
//  AppointmentCard.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 23/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI
import MapKit

struct AppointmentCard: View {
    
    @ObservedObject var account: AccountViewModel = .account
    @State var showMap = false
    @State var region = MKCoordinateRegion()
    @State var places = [Place(name: "", latitude: 0, longitude: 0)]
    @State var isAddedToCal = false
    
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
                        MapView(region: $region, places: $places)
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
            if !isAddedToCal {
                Text("Add to your calendar").underline().fontWeight(.medium).foregroundColor(Color(red: 12/255, green: 92/255, blue: 214/255)).padding(5).onTapGesture {
                    checkCalendarAuthorizationStatus(booking: account.aBooking)
                    self.isAddedToCal = true
                }
            } else {
                Text("Booking added to calendar").font(.system(size: 14, weight: .medium)).foregroundColor(Color.gray).padding(5)
            }
        }.padding().background(Color.blueVybz).cornerRadius(22).clipped().shadow(color: Color.shadow, radius: 7, x: 0, y: 2).frame(width: 320).onAppear(){
            places = [Place(name: account.aBooking.location, latitude: account.aStationLatitude, longitude: account.aStationLongitude)]
            region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: account.aStationLatitude, longitude: account.aStationLongitude),
                span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        }
    }
}

struct AppointmentCard_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentCard()
    }
}
