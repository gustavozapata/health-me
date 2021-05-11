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

/*
 10*9 or 10^9,
 they both mean 1 billion.
 So for example, total white cell count is 6.8 billion per litre of blood.
 */
func redBloodCells(_ count: Double) -> String {
    if count < 4 {
        return "This is too low - this can cause feelings of fatigue and weakness and your body has to work harder to get enough oxygen to the cells"
    } else if count > 6 {
        return "This is too high - this may be a symptom of a disease or disorder"
    } else if count > 4.8 && count < 5.2 {
        return "This looks good :)"
    }
    return ""
}

/*
 A blood sugar level less than 140 mg/dL (7.8 mmol/L) is normal.
 A reading of more than 200 mg/dL (11.1 mmol/L) after two hours indicates diabetes.
 A reading between 140 and 199 mg/dL (7.8 mmol/L and 11.0 mmol/L) indicates prediabetes.
 (The standard for measuring blood glucose is "mg/dL" which means milligrams per deciliter.)
 */
func glucoseLevels(_ count: Int) -> String {
    if count < 140 {
        return "This is good :)"
    } else if count > 200 {
        return "This is too high - this may be a sign of diabetes"
    } else if count > 140 && count < 199 {
        return "This is high - this may be a sign of prediabetes"
    }
    return ""
}

/*
 Good: Less than 200 (but the lower the better)
 Borderline: 200–239
 High: 240 or higher
 */
func cholesterolLevel(_ count: Int) -> String {
    if count < 200 {
        return "This is good :)"
    } else if count > 240 {
        return "This is too high"
    } else if count > 200 && count < 239 {
        return "This is ok"
    }
    return ""
}

func measureBar(_ count: Int, min: Int, max: Int) -> Int {
    return ((count - min) * 100) / (max - min)
}
