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
    var location: String
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
}
final class BloodStationData: ObservableObject {
    @Published var stations = bloodStationsData
}
