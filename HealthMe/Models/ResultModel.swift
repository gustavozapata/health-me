//
//  ResultModel.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 02/05/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import Foundation

struct ResultsModel: Decodable, Hashable {
    var blood_type: String
    var test: String
    var date: Date
    var red_blood_cells: Double
    var whiteBloodCells: Int
    var cholesterolLevel: Int
    var glucose_level: Int
    var plateletCount: Int
}
