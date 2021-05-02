//
//  AccountService.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 02/05/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import Foundation

struct ServerResponse<Model: Decodable>: Decodable {
    var data: Model
}

class AppService {
    
    // compose the head and body of the request
    func createRequest(_ method: String, _ urlPath: String, _ params: [String: Any]) -> URLRequest {
        let url = URL(string: "\(LocalVars.localHost)/api/v1\(urlPath)")!
        let data = try? JSONSerialization.data(withJSONObject: params)
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = data
        return request
    }
    
    // decode date from JSON response
    func decodeJSONDate(data: Data) -> (dataJSON: Data, decoderJSON: JSONDecoder) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let decoderJSON = JSONDecoder()
        let dataJSON = data
        decoderJSON.dateDecodingStrategy = .formatted(formatter)
        return (dataJSON, decoderJSON)
    }
    
    // requests that mutate the database - POST, PATCH, DELETE, etc.
    func updateRequest(params: [String: Any], path: String, method: String, completion: @escaping (_ response: UserModel) -> ()) {
        let task = URLSession.shared.dataTask(with: self.createRequest(method, path, params)) { data, response, error in
            if let data = data {
                do {
                    let decoder = self.decodeJSONDate(data: data)
                    let decodeResponse = try decoder.decoderJSON.decode(ServerResponse<UserModel>.self, from: decoder.dataJSON)
                    DispatchQueue.main.async {
                        completion(decodeResponse.data)
                    }
                } catch let error as NSError {
                    print("JSON decode failed: \(error)")
                }
                return
            }
        }
        task.resume()
    }
    
    // retrieves data
    func getRequest(url: URL, completion: @escaping (_ response: UserModel) -> ()) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = self.decodeJSONDate(data: data)
                    let decodeResponse = try decoder.decoderJSON.decode(ServerResponse<UserModel>.self, from: decoder.dataJSON)
                    DispatchQueue.main.async {
                        completion(decodeResponse.data)
                    }
                } catch let error as NSError {
                    print("JSON decode failed: \(error)")
                }
                return
            }
        }
        task.resume()
    }
    
    // get all the bookings (all stations and all dates) to check availability
    func getBookingDates(url: URL, completion: @escaping (_ response: Bookings) -> ()) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = AppService().decodeJSONDate(data: data)
                    let decodeResponse = try decoder.decoderJSON.decode(ServerResponse<Bookings>.self, from: decoder.dataJSON)
                    DispatchQueue.main.async {
                        completion(decodeResponse.data)
                    }
                } catch let error as NSError {
                    print("JSON decode failed: \(error)")
                }
                return
            }
        }
        task.resume()
    }
    
    // get all blood stations to select one when booking an appointment
    func getBloodStations(url: URL, completion: @escaping (_ response: [StationModel]) -> ()){
        let url = URL(string: "\(LocalVars.localHost)/api/v1/stations")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data {
                do {
                    let decodeResponse = try JSONDecoder().decode(ServerResponse<[StationModel]>.self, from: data)
                    DispatchQueue.main.async {
                        completion(decodeResponse.data)
                    }
                } catch let error as NSError {
                    print("JSON decode failed: \(error)")
                }
                return
            }
        }
        task.resume()
    }
}
