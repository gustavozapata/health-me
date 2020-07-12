//
//  AccountModel.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 12/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI
import Combine

struct MessagesModel: Codable, Hashable, Identifiable {
    var id: Int
    var sender: String
    var message: String
    var date: String
    var mensajes: [Mensaje]
    
    struct Mensaje: Codable, Hashable {
        var missa: String
        var fecha: String
        var sender: String
    }
}

final class MessagesData: ObservableObject {
    @Published var messages = messagesData
}

