//
//  StationList.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 04/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct StationList: View {
    
    @State var stationSelected = ""
    
    var body: some View {
        VStack {
            StationRow(stationSelected: self.$stationSelected, location: "Kingston", address: "32 Richmond road", postcode: "KT2 7PQ")
            StationRow(stationSelected: self.$stationSelected, location: "Surbiton", address: "12 Happy avenue", postcode: "KT3 4XD")
        }
    }
}

struct StationRow: View {
    
    var location: String
    var address: String
    var postcode: String
    
    @Binding var stationSelected: String
    
    init(stationSelected: Binding<String>, location: String, address: String, postcode: String) {
        self.location = location
        self.address = address
        self.postcode = postcode
        self._stationSelected = stationSelected
    }
    
    var body: some View {
        VStack {
            HStack {
                Image("station").resizable().aspectRatio(contentMode: .fit).frame(width: 85).padding(.horizontal)
                VStack(alignment: .leading, spacing: 5) {
                    Text(self.location).font(.system(size: 18, weight: .bold))
                    Text(self.address).font(.system(size: 16, weight: .medium))
                    Text(self.postcode).font(.system(size: 16))
                }.padding([.trailing, .bottom, .top], 10)
                Spacer()
            }
        }.frame(width: 320).background(self.stationSelected == self.location ? Color.selectedItem : Color.white).cornerRadius(16).shadow(radius: 1, x: 0, y: 1).padding(.bottom, 10).onTapGesture {
            self.stationSelected = self.location
        }
    }
}

struct StationList_Previews: PreviewProvider {
    static var previews: some View {
        StationList()
    }
}
