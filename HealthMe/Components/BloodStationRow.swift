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
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 12) {
                    Text(bloodStation.location).fontWeight(.bold)
                    Text(bloodStation.address).fontWeight(.medium)
                    Text(bloodStation.postcode).fontWeight(.medium)
                }
                VStack {
                    Image("map_icon").resizable().aspectRatio(contentMode: .fit).frame(width: 24)
                    Text("See map").font(.system(size: 14)).underline()
                    HStack(alignment: .bottom, spacing: 3) {
                        Image("phone_icon").resizable().aspectRatio(contentMode: .fit).frame(width: 15)
                        Text(bloodStation.telephone).font(.system(size: 13)).underline()
                    }
                }
            }.padding(10).overlay(
                RoundedRectangle(cornerRadius: 9)
                    .stroke(Color.black, lineWidth: 1)
            )
        }.frame(minWidth: 360)
    }
}

struct BloodStationRow_Previews: PreviewProvider {
    static var previews: some View {
        BloodStationRow(bloodStation: bloodStationsData[0])
    }
}
