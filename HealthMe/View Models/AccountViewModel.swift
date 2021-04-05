//
//  AccountViewModel.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 24/01/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import Foundation

//******
struct ServerResponse<Model: Decodable>: Decodable {
    var data: Model
}
struct UserModel: Decodable {
    var _id: String
    var fullname: String
    var email: String
    var password: String
    var bookings: [BookingModel]
    var results: [ResultsModel]
    var messages: [MessageModel]
}
struct BookingModel: Decodable, Hashable {
    var location: String
    var address: String
    var date: Date
    var time: String
}
struct Bookings: Decodable {
    var bookings: [BookingModel]
}
///replace for the ResultModel (without 's')
struct ResultsModel: Decodable, Hashable {
    var blood_type: String
    var test: String
    var date: String
    var red_blood_cells: Int
    var whiteBloodCells:Int
    var cholesterolLevel:Int
    var glucose_level:Int
    var hemoglobin:Int
    var plateletCount:Int
}
struct MessageModel: Decodable, Hashable {
    var sender: String
    var read: Bool
    var threads: [ThreadModel]
}
struct ThreadModel: Decodable, Hashable {
    var date: String
    var time: String
    var text: String
    var user: Bool
    var options: [String]
}
//******

class AccountViewModel: ObservableObject {
    
    private init(){}
    static let account = AccountViewModel()
    
    @Published var user: String?
    @Published var isLogged: Bool = false
    @Published var appMsg: String? = ""
    @Published var showApp: Bool = false
    @Published var userModel: UserModel?
    @Published var bookingModel: Bookings?
    
    var aBooking = BookingModel(location: "", address: "", date: Date(), time: "")
    var isNewBooking = false
    
    func logout() {
        self.isLogged = false
        self.showApp = false
    }
    
    func createRequest(_ method: String, _ urlPath: String, _ params: [String: Any]) -> URLRequest {
        let url = URL(string: "\(LocalVars.localHost)/api/v1\(urlPath)")!
        let data = try? JSONSerialization.data(withJSONObject: params)
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = data
        return request
    }
    
    //Decode date from JSON response
    func decodeJSONDate(data: Data) -> (dataJSON: Data, decoderJSON: JSONDecoder) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let decoderJSON = JSONDecoder()
        let dataJSON = data
        decoderJSON.dateDecodingStrategy = .formatted(formatter)
        return (dataJSON, decoderJSON)
    }
    
    func addBooking(completion: @escaping () -> ()) {
        let params: [String: Any] = ["location": self.aBooking.location, "address": self.aBooking.address, "date": dateToString(date: self.aBooking.date, time: self.aBooking.time, format: "date"), "time": self.aBooking.time]
        let task = URLSession.shared.dataTask(with: createRequest("POST", "/bookings/\(userModel!._id)", params)) { data, response, error in
            if let data = data {
                do {
                    let decoder = self.decodeJSONDate(data: data)
                    _ = try decoder.decoderJSON.decode(ServerResponse<UserModel>.self, from: decoder.dataJSON)
                    DispatchQueue.main.async {
                        completion()
                    }
                } catch let error as NSError {
                    print("JSON decode failed: \(error)")
                }
                return
            }
        }
        task.resume()
    }
    
    func getBookingDates(completion: @escaping () -> ()){
        let url = URL(string: "\(LocalVars.localHost)/api/v1/bookings/\(userModel!._id)")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data {
                do {
                    let decoder = self.decodeJSONDate(data: data)
                    let decodeResponse = try decoder.decoderJSON.decode(ServerResponse<Bookings>.self, from: decoder.dataJSON)
                    DispatchQueue.main.async {
                        self.bookingModel = decodeResponse.data
                        completion()
                    }
                } catch let error as NSError {
                    print("JSON decode failed: \(error)")
                }
                return
            }
        }
        task.resume()
    }
    
    func sendMessage(_ message: String, _ sender: String, completion: @escaping () -> ()) {
        let params: [String: Any] = ["sender": sender, "message": "\(message)"]
        let task = URLSession.shared.dataTask(with: createRequest("POST", "/messages/\(userModel!._id)", params)) { data, response, error in
            if let data = data {
                do {
                    let decodeResponse = try JSONDecoder().decode(ServerResponse<UserModel>.self, from: data)
                    DispatchQueue.main.async {
                        self.userModel = decodeResponse.data
                        completion()
                    }
                } catch let error as NSError {
                    print("JSON decode failed: \(error)")
                }
                return
            }
        }
        task.resume()
    }
    
    func login(_ email: String, _ password: String, completion: @escaping () -> ()) {
        let params: [String: Any] = ["email": "\(email)", "password": "\(password)"]
        let task = URLSession.shared.dataTask(with: createRequest("POST", "/users/login", params)) { data, response, error in
            if let data = data {
                do {
                    let decoder = self.decodeJSONDate(data: data)
                    let decodeResponse = try decoder.decoderJSON.decode(ServerResponse<UserModel>.self, from: decoder.dataJSON)
                    DispatchQueue.main.async {
                        self.userModel = decodeResponse.data
                        self.isLogged = true
                        completion()
                    }
                } catch let error as NSError {
                    print("JSON decode failed: \(error)")
                }
                return
            }
        }
        task.resume()
    }
    
    func signup(_ fullname: String, _ email: String, _ password: String, completion: @escaping () -> ()) {
        let params: [String: Any] = ["fullname": "\(fullname)", "email": "\(email)", "password": "\(password)"]
        let task = URLSession.shared.dataTask(with: createRequest("POST", "/users/signup", params)) { data, response, error in
            if let data = data {
                do {
                    let decodeResponse = try JSONDecoder().decode(ServerResponse<UserModel>.self, from: data)
                    DispatchQueue.main.async {
                        self.userModel = decodeResponse.data
                        self.isLogged = true
                        completion()
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
