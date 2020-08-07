//
//  BloodStations.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 07/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import Foundation

struct BloodStation {
    var location: String
    var address: String
    var postcode: String
    
    init(location: String, address: String, postcode: String){
        self.location = location
        self.address = address
        self.postcode = postcode
    }
}

extension BloodStation {
    static func all() -> [BloodStation] {
        return [
            BloodStation(location: "Kingston", address: "32 Richmond road", postcode: "KT2 7PQ"),
            BloodStation(location: "Surbiton", address: "12 Happy avenue", postcode: "KT3 4XD"),
        ]
    }
}



