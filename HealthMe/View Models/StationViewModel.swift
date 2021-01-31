//
//  StationViewModel.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 01/09/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import Foundation

class StationViewModel {
    var station: StationModel
    
    init(station: StationModel) {
        self.station = station
    }
    
    //var id = UUID()
    var id: String {
        return self.station._id
    }
    var location: String {
        return self.station.location
    }
    var address: String {
        return self.station.address
    }
    var postcode: String {
        return self.station.postcode
    }
    var telephone: String {
        return self.station.telephone
    }
}

class StationListViewModel: ObservableObject {
    @Published var stations = [StationViewModel]()
    @Published var hasFetched = true
    
    init() {
        fetchStations()
    }
    
    func fetchStations() {
        StationService().getStations { stations in
            ///Update (if data from DB map it, else get the json file)
            if (stations != nil) {
                self.hasFetched = true
                if let stations = stations {
                    self.stations = stations.map(StationViewModel.init)
                }
            } else {
                self.hasFetched = false
            }
            
            ///Original (without else hardcoded data)
            //if let stations = stations {
                //self.stations = stations.map(StationViewModel.init)
            //}
        }
    }
}

