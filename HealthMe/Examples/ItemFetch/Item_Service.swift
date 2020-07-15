//
//  Item_Service.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 14/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import Foundation

class ItemService {
    
    func getItems(elemento: String, completion: @escaping (Item?) -> ()) {
        let hosta = LocalVars()
        guard let url = URL(string: "\(hosta.host)/api/v1/\(elemento)") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let itemResponse = try? JSONDecoder().decode(ItemResponse.self, from: data)
            
            if let itemResponse = itemResponse {
                let item = itemResponse.data
                completion(item)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
