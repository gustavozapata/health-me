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
    
    @ObservedObject var account: AccountViewModel = .account
    @Binding var stationId: String
    
    init(stationId: Binding<String>) {
        self._stationId = stationId
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            ForEach(account.stations.filter({"\($0.location.lowercased())".contains(account.searchTerm.lowercased()) || "\($0.postcode.lowercased())".contains(account.searchTerm.lowercased()) || account.searchTerm.isEmpty }), id: \._id){ station in
                StationRow(bloodStation: station, selectedStation: self.$stationId)
            }
        }
    }
}

struct StationListView_Previews: PreviewProvider {
    static var previews: some View {
        StationListView(stationId: .constant("434324bb"))
    }
}
