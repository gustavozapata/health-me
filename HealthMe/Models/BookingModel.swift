//
//  BookingModel.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 02/05/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import Foundation

struct BookingModel: Decodable, Hashable {
    var _id: String
    var location: String
    var address: String
    var date: Date
    var time: String
}

struct Bookings: Decodable {
    var bookings: [BookingModel]
}

struct CreditCardModel: Decodable, Hashable {
    var cardNumber: String
    var cardHolder: String
    var cardExpiresYear: String
    var cardExpiresMonth: String
    var cardCVV: String
}
