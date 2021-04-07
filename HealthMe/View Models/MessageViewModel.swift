//
//  MessageViewModel.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 21/02/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import Foundation

class MessageViewModel: ObservableObject {
    private init(){}
    static let message = MessageViewModel()
    
    @Published var userModel: UserModel?
    @Published var account: AccountViewModel = .account
    
    func sendMessage(_ message: String, completion: @escaping () -> ()) {
        let json: [String: Any] = ["message": "\(message)"]
        let messageData = try? JSONSerialization.data(withJSONObject: json)
        
        let url = URL(string: "\(LocalVars.localHost)/api/v1/messages/\(account.userModel!._id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = messageData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
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
}
