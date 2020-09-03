//
//  dataModels.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 18/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

//BLOOD TESTS
struct BloodTestModel: Decodable, Identifiable {
    var id: Int
    var date: String
    var time: String
    var location: String
    var address: String
}
final class BloodTestData: ObservableObject {
    @Published var pastTests = pastTestsData
}

//BLOOD STATIONS
struct BloodStationModel: Decodable, Identifiable {
    var id: Int
    var location: String
    var address: String
    var postcode: String
    var telephone: String
}

final class BloodStationData: ObservableObject {
    @Published var stations = bloodStationsData
}

//BOOKINGS
struct BookingsModel: Decodable, Identifiable {
    var id: Int
    var station: Int
    var user: Int
    var month: String
    var day: Int
    var time: String
}
final class BookingsData: ObservableObject {
    @Published var bookings = bookingsData
}

//MESSAGES
struct MessagesModel: Codable, Hashable, Identifiable {
    var id: Int
    var sender: String
    var message: String
    var date: String
    var unread: Bool
    var mensajes: [Mensaje]
    
    struct Mensaje: Codable, Hashable {
        var missa: String
        var fecha: String
        var sender: String
        var sent: Bool
    }
}
final class MessagesData: ObservableObject {
    @Published var messages = messagesData
}


//RESULTS
struct ResultModel: Decodable, Identifiable {
    var id: Int
    var name: String
    var date: String
    var summary: [String]
    var bloodType: String
    var cells: String
}
final class ResultData: ObservableObject {
    @Published var results = resultsData
}
