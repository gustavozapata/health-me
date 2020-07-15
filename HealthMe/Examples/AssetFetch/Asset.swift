//
//  Asset.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 14/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import Foundation

struct Kapp: Decodable {
    //this is for the root of our response e.g. { status: 200, data: [...] }
    //status, data have to match the name in the end-point response
    let status: String
    let data: [Asset]
}

struct Asset: Decodable, Hashable {
//    var id = UUID()
    
    var name: String?
    var description: String?
}
