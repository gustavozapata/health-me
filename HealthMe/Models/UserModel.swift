//
//  UserModel.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 02/05/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import Foundation

struct UserModel: Decodable {
    var _id: String
    var fullname: String
    var email: String
    var password: String
    var bookings: [BookingModel]
    var results: [ResultsModel]
    var messages: [MessageModel]
}
