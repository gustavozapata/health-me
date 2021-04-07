//
//  StationRow.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 02/09/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct StationRow: View {
    
    @ObservedObject var account: AccountViewModel = .account
    var bloodStation: StationViewModel
    @Binding var selectedStation: String
    @State var showMap = false
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 12) {
                    Text(bloodStation.location).fontWeight(.bold)
                    Text(bloodStation.address).fontWeight(.medium)
                    Text(bloodStation.postcode).fontWeight(.medium)
                }
                Spacer()
                VStack {
                    Image("map_icon").resizable().aspectRatio(contentMode: .fit).frame(width: 24)
                    Button(action: {
                        self.showMap.toggle()
                    }) {
                        Text("See map").font(.system(size: 14)).underline().foregroundColor(Color.primary)
                    }.sheet(isPresented: $showMap){
                        MapView()
                    }
                    
                    Spacer()
                    HStack(alignment: .center, spacing: 3) {
                        Image("phone_icon").resizable().aspectRatio(contentMode: .fit).frame(width: 15)
                        Text(bloodStation.telephone).font(.system(size: 13)).underline().onTapGesture {
                            guard let url = URL(string: "tel://\(bloodStation.telephone)") else { return }
                            UIApplication.shared.open(url)
                        }
                    }
                }.frame(width: 110,height: 100)
            }.padding().frame(width: 320).background(self.selectedStation == self.bloodStation.id ? Color.selectedItem : Color.white)
            .cornerRadius(16).shadow(radius: 1, x: 0, y: 1).padding(.bottom, 10)
        }.onTapGesture {
            self.selectedStation = self.bloodStation.id
            account.aBooking.address = bloodStation.address
            account.aBooking.location = bloodStation.location
        }
    }
}

struct StationRow_Previews: PreviewProvider {
    static var previews: some View {
        StationRow(bloodStation: StationViewModel(station: StationModel(_id: "4555b433", location: "Location", address: "address", postcode: "postcode", telephone: "02020202")), selectedStation: .constant("4555b433"))
    }
}
