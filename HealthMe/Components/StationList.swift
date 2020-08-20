//
//  StationList.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 04/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct StationList: View {
    
    var stations: BloodStationData
    @State var stationSelected = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            ForEach(stations.stations){ station in
                BloodStationRow(bloodStation: station)
//                StationRow(bloodStation: station, stationSelected: .constant(""))
            }
        }
    }
}

struct StationList_Previews: PreviewProvider {
    static var previews: some View {
        StationList(stations: BloodStationData())
    }
}
