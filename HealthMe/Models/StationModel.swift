//
//  StationModel.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 02/09/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import Foundation

struct MapResponse: Decodable {
    var data: [StationModel]
}

struct StationModel: Codable, Hashable {
    var _id: String
    var location: String
    var address: String
    var postcode: String
    var telephone: String
}
