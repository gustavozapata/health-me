//
//  StationListView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 02/09/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

///This view renders the stations from a network call
struct StationListView: View {
    
    var bloodStations: [StationViewModel]
    @Binding var stationId: String
    
    init(bloodStations: [StationViewModel], stationId: Binding<String>) {
        self.bloodStations = bloodStations
        self._stationId = stationId
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            ForEach(self.bloodStations, id: \.id){ station in
                StationRow(bloodStation: station, selectedStation: self.$stationId)
            }
        }
    }
}

struct StationListView_Previews: PreviewProvider {
    static var previews: some View {
        StationListView(bloodStations: [StationViewModel(station: StationModel(_id: "434324bb", location: "Location", address: "address", postcode: "postcode", telephone: "02020202"))], stationId: .constant("434324bb"))
    }
}
