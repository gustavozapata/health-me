//
//  StationModel.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 02/09/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import Foundation

struct StationModel: Decodable, Hashable {
    var _id: String
    var location: String
    var address: String
    var postcode: String
    var latitude: Double
    var longitude: Double
    var telephone: String
}

struct MapResponse: Decodable {
    var data: [StationModelOLD]
}
struct StationModelOLD: Codable, Hashable {
    var _id: String
    var location: String
    var address: String
    var postcode: String
    var telephone: String
}
