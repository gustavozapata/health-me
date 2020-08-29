//
//  HelperFunc.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 11/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

//IDENTIFY CREDIT CARD ISSUER
//https://stackoverflow.com/questions/72768/how-do-you-detect-credit-card-type-based-on-number
//https://stackoverflow.com/questions/59988892/swiftui-email-validation
func creditCardIssuer(_ num: String) -> String {
    //    let visa = "^4[0-9]{6,}$"
    //    let mastercard = "^5[1-5][0-9]{5,}|222[1-9][0-9]{3,}|22[3-9][0-9]{4,}|2[3-6][0-9]{5,}|27[01][0-9]{4,}|2720[0-9]{3,}$"
    //    let isVisa = NSPredicate(format:"SELF MATCHES %@", visa)
    //    let isMaster = NSPredicate(format: "SELF MATCHES %@", mastercard)
    
    //    if isVisa {
    //        return "visa_label"
    //    } else if isMaster {
    //        return "mastercard_label"
    //    }
    
    return ""
}
