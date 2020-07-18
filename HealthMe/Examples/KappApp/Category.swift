//
//  Category.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 18/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import Foundation

struct Category: Decodable {
    let status: String
    let data: [Doc]
}

struct Doc: Decodable {
    var name: String
    var description: String
}
