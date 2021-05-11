//
//  ResultsAnalysis.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 27/02/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import Foundation

func bloodTypeInfo(_ type: String) -> (percentage: Int, common: String) {
    /* Blood type: https://www.blood.co.uk/why-give-blood/blood-types/
     O positive: 35% - O negative: 13% - A positive: 30% - A negative: 8% - B positive: 8% - B negative: 2% - AB positive: 2% - AB negative: 1%
     */
    var percentage = 0
    var common = ""
    switch(type) {
    case "O+":
        percentage = 35
        common = "most"
        break;
    case "O-":
        percentage = 13
        break;
    case "A+":
        percentage = 30
        break;
    case "A-":
        percentage = 8
        break;
    case "B+":
        percentage = 8
    case "B-":
        percentage = 2
    case "AB+":
        percentage = 2
    case "AB-":
        percentage = 1
        common = "least"
    default: break
    }
    return (percentage, common)
}
