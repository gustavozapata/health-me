//
//  ResultModel.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 02/05/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import Foundation

///replace for the ResultModel (without 's')
struct ResultsModel: Decodable, Hashable {
    var blood_type: String
    var test: String
    var date: Date
    var red_blood_cells: Int
    var whiteBloodCells:Int
    var cholesterolLevel:Int
    var glucose_level:Int
    var hemoglobin:Int
    var plateletCount:Int
}
