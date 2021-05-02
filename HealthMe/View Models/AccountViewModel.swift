//
//  AccountViewModel.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 24/01/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import Foundation

class AccountViewModel: ObservableObject {
    
    // singleton pattern - only one instance of a class is allowed
    private init(){}
    static let account = AccountViewModel()
    
    @Published var user: String?
    @Published var isLogged = false
    @Published var appMsg: String? = ""
    @Published var showApp: Bool = false
    @Published var userModel: UserModel?
    @Published var bookingModel: Bookings?
    @Published var stations: [StationModel] = [StationModel(_id: "-", location: "", address: "", postcode: "", latitude: 0.0, longitude: 0.0, telephone: "")]
    @Published var aCreditCard = CreditCardModel(cardNumber: "", cardHolder: "", cardExpiresYear: "", cardExpiresMonth: "", cardCVV: "")
    @Published var searchTerm = ""
    @Published var newMsg = false
    @Published var hasPassSetup = false
    @Published var isUnlocked = false
    @Published var showPassSetup = false
    @Published var passcode = ""
    
    // local storage variables
    @Published var isDark = UserDefaults.standard.bool(forKey: "isDark")
    @Published var requiredPass = UserDefaults.standard.bool(forKey: "requiredPass")
    
    var aBooking = BookingModel(_id: "", location: "", address: "", date: Date(), time: "")
    var aStationLatitude = 0.0
    var aStationLongitude = 0.0
    var isNewBooking = false
    
    
    func login(_ email: String, _ password: String, completion: @escaping () -> ()) {
        let params: [String: Any] = ["email": "\(email)", "password": "\(password)"]
        AppService().updateRequest(params: params, path: "/users/login", method: "POST"){ response in
            self.userModel = response
            self.isLogged = true
            completion()
        }
    }
    
    func logout() {
        self.isLogged = false
        self.showApp = false
    }
    
    func signup(_ fullname: String, _ email: String, _ password: String, completion: @escaping () -> ()) {
        let params: [String: Any] = ["fullname": "\(fullname)", "email": "\(email)", "password": "\(password)"]
        AppService().updateRequest(params: params, path: "/users/signup", method: "POST"){ response in
            self.userModel = response
            self.isLogged = true
            self.newMsg = true
            completion()
        }
    }
    
    func addBooking(completion: @escaping () -> ()) {
        let params: [String: Any] = ["location": self.aBooking.location, "address": self.aBooking.address, "date": dateToString(date: self.aBooking.date, time: self.aBooking.time, format: "date"), "time": self.aBooking.time]
        AppService().updateRequest(params: params, path: "/bookings/\(userModel!._id)", method: "POST"){ response in
            self.userModel = response
            self.newMsg = true
            completion()
        }
    }
    
    func updateDetails(_ fullname: String, _ email: String, completion: @escaping () -> ()) {
        let params: [String: Any] = ["fullname": "\(fullname)", "email": "\(email)"]
        AppService().updateRequest(params: params, path: "/users/update/\(userModel!._id)", method: "PATCH"){ response in
            self.userModel = response
            completion()
        }
    }
    
    func getBloodStations(completion: @escaping () -> ()){
        let url = URL(string: "\(LocalVars.localHost)/api/v1/stations")
        AppService().getBloodStations(url: url!){ response in
            self.stations = response
            completion()
        }
    }
    
    func cancelBooking(_ booking: String, completion: @escaping () -> ()) {
        let params: [String: Any] = ["_id": booking]
        AppService().updateRequest(params: params, path: "/bookings/\(userModel!._id)", method: "DELETE"){ response in
            self.userModel = response
            completion()
        }
    }
    
    func getBookingDates(completion: @escaping () -> ()){
        let url = URL(string: "\(LocalVars.localHost)/api/v1/bookings/\(userModel!._id)")
        AppService().getBookingDates(url: url!){ response in
            self.bookingModel = response
            completion()
        }
    }
    
    func sendMessage(_ message: MessageOptionModel, completion: @escaping () -> ()) {
        let params: [String: Any] = ["code": message.code, "option": "\(message.option)"]
        AppService().updateRequest(params: params, path: "/messages/\(userModel!._id)", method: "POST"){ response in
            self.userModel = response
            completion()
        }
    }
    
    func addPayment(completion: @escaping () -> ()) {
        let params: [String: Any] = ["booking": dateToString(date: aBooking.date, format: "text")]
        let task = URLSession.shared.dataTask(with: AppService().createRequest("POST", "/bookings/pay/\(userModel!._id)", params)) { data, response, error in
            completion()
        }
        task.resume()
    }
}
