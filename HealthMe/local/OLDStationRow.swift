//
//  StationRow.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 18/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

//FIXME: FIRST VERSION
struct OLDStationRow: View {
    var bloodStation: BloodStationModel
    @Binding var stationSelected: String
    
    var body: some View {
        
        VStack {
            HStack {
                Image("station").resizable().aspectRatio(contentMode: .fit).frame(width: 85).padding(.horizontal)
                VStack(alignment: .leading, spacing: 5) {
                    Text(bloodStation.location).font(.system(size: 18, weight: .bold))
                    Text(bloodStation.address).font(.system(size: 16, weight: .medium))
                    Text(bloodStation.postcode).font(.system(size: 16))
                }.padding([.trailing, .bottom, .top], 10)
                Spacer()
            }
        }.frame(width: 320).background(self.stationSelected == bloodStation.location ? Color.selectedItem : Color.white).cornerRadius(16).shadow(radius: 1, x: 0, y: 1).padding(.bottom, 10).onTapGesture {
            self.stationSelected = self.bloodStation.location
        }
        
        
        //        VStack {
        //            HStack {
        //                Image("station").resizable().aspectRatio(contentMode: .fit).frame(width: 85).padding(.horizontal)
        //                VStack(alignment: .leading, spacing: 5) {
        //                    Text(bloodStation.location).font(.system(size: 18, weight: .bold))
        //                    Text(bloodStation.address).font(.system(size: 16, weight: .medium))
        //                    Text(bloodStation.postcode).font(.system(size: 16))
        //                }.padding([.trailing, .bottom, .top], 10)
        //                Spacer()
        //            }
        //        }
    }
}
