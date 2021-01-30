//
//  AccountViewModel.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 24/01/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import Foundation

//TODO: LOGIN USING UserDefaults  ******
class UserStore: ObservableObject {
    @Published var isLogged: Bool = UserDefaults.standard.bool(forKey: "isLogged") {
        didSet {
            UserDefaults.standard.set(self.isLogged, forKey: "isLogged")
        }
    }
    @Published var showLogin = false
}
struct BookingModelz: Decodable, Identifiable {
    var id: Int
    var location: String
    var address: String
    var date: String
    var time: String
}
//BOOKINGS
/*{
    "id": 1,
    "station": 2,
    "user": 4,
    "month": "Aug",
    "day": 19,
    "time": "14:00"
}*/
struct VookingsModel: Decodable, Identifiable {
    var id: Int
    var station: Int
    var user: Int
    var month: String
    var day: Int
    var time: String
}
//var pastTests: BloodTestData - ForEach(pastTests.pastTests)
final class VookingsData: ObservableObject {
    @Published var bookings = bookingsData
    
//    let bookingsData: [BookingsModel] = load("bookings.json")
    func load<T: Decodable>(_ filename: String) -> T {
        let data: Data
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {fatalError("Couldn't find \(filename) in main bundle.")}
        do {data = try Data(contentsOf: file)} catch {fatalError("Couldn't load \(filename) from main bundle:\n\(error)")}
        do {let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)} catch {fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")}
    }
}
//*******

class AccountViewModel: ObservableObject {
    
    private init(){}
    static let account = AccountViewModel()
    
    @Published var user: String?
    @Published var isLogged: Bool = true
    @Published var appMsg: String? = ""
    @Published var showApp: Bool = false
    @Published var bookingz = [BookingModelz]()
    
    func logout() {
        self.isLogged = false
        self.showApp = false
    }
    
    func login(_ email: String, _ password: String, completion: @escaping () -> ()) {
        
        // prepare json data
        let json: [String: Any] = ["email": "\(email)", "password": "\(password)"]
        let loginData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        let url = URL(string: "\(LocalVars.localHost)/api/v1/users/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // insert json data to the request
        request.httpBody = loginData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                DispatchQueue.main.async {
                    self.isLogged = responseJSON["isLogged"] as! Bool
                    if self.isLogged {
                        self.bookingz = responseJSON["bookings"] as! [BookingModelz]
                    } else {
                        self.appMsg = responseJSON["message"] as? String
                    }
                    completion()
                }
                
            }
        }
        task.resume()
    }
    
    func signup(_ fullname: String, _ email: String, _ password: String, completion: @escaping () -> ()) {
        let json: [String: Any] = ["fullname": "\(fullname)", "email": "\(email)", "password": "\(password)"]
        let signupData = try? JSONSerialization.data(withJSONObject: json)
        
        let url = URL(string: "\(LocalVars.localHost)/api/v1/users/signup")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = signupData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                DispatchQueue.main.async {
                    self.isLogged = responseJSON["isLogged"] as! Bool
                    completion()
                }
                
            }
        }
        task.resume()
    }
}
