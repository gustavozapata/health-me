//
//  FetchDataSample.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 02/09/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import Foundation

struct Response: Decodable {
    var data: [Estacion]
}

struct Estacion: Decodable, Hashable {
    var location: String?
    var address: String?
    var postcode: String?
    var telephone: Int?
}
