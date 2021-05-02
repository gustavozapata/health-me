//
//  MessageModel.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 02/05/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import Foundation

struct MessageModel: Decodable, Hashable {
    var date: Date
    var time: String
    var text: String
    var isUser: Bool
    var options: [MessageOptionModel]
}

struct MessageOptionModel: Decodable, Hashable {
    var code: Int
    var option: String
}
