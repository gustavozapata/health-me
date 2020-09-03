//
//  BloodStationRow.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 20/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct BloodStationRow: View {
    
    var bloodStation: BloodStationModel

    @Binding var selectedStation: Int
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
                        Text(bloodStation.telephone).font(.system(size: 13)).underline()
                    }
                }.frame(width: 110,height: 100)
            }.padding().frame(width: 320)
                .background(self.selectedStation == self.bloodStation.id ? Color.selectedItem : Color.white)
                .cornerRadius(16).shadow(radius: 1, x: 0, y: 1).padding(.bottom, 10)
            //TODO: border style black solid version
            //            .padding(10).overlay(
            //                RoundedRectangle(cornerRadius: 9)
            //                    .stroke(Color.black, lineWidth: 1)
            //            ).frame(maxWidth: 330)
        }.onTapGesture {
            self.selectedStation = self.bloodStation.id
        }
    }
}

struct BloodStationRow_Previews: PreviewProvider {
    static var previews: some View {
        BloodStationRow(bloodStation: bloodStationsData[0], selectedStation: .constant(-1))
    }
}
