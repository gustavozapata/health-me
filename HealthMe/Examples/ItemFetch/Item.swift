//
//  Item_Fetch.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 14/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import Foundation

struct ItemResponse: Decodable {
    //this is for the root of our response e.g. { status: 200, data: [...] }
    let status: String
    let data: Item //status, data have to match the name in the end-point response
}

struct Item: Decodable {
    var description: String?
}

