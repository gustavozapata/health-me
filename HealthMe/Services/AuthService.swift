//
//  AuthService.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 24/01/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import Foundation

/// ONLY USED FOR TESTING 
class AuthService {
    
    func login() {
        guard let url = URL(string: "\(LocalVars.localHost)/api/v1/users/login") else {
            //completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
//                    completion(nil)
                }
                return
            }
            
            print(data)
//            let auth = try? JSONDecoder().decode(MapResponse.self, from: data)
            DispatchQueue.main.async {
//                completion(stations?.data)
            }
        }.resume()
        
    }
}
