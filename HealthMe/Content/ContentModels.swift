//
//  ProfileModel.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 10/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct ProfileModel: Decodable, Identifiable {
    var id: Int
    var name: String
    var description: String
}
