//
//  Data.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 10/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import UIKit
import SwiftUI
import Foundation

let profileData: [ProfileModel] = load("profileOptions.json")
let messagesData: [MessagesModel] = load("messages.json")
let pastTestsData: [BloodTestModel] = load("pastTests.json")
let bloodStationsData: [BloodStationModel] = load("bloodStations.json")
let bookingsData: [BookingsModel] = load("bookings.json")
let resultsData: [ResultModel] = load("results.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

