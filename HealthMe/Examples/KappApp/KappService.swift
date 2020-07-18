//
//  KappService.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 18/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import Foundation

class KappService {
    
    func getAllDocs(completion: @escaping ([Doc]?) -> ()) {
        let hosta = LocalVars()
        
        guard let url = URL(string: "\(hosta.host)/api/v1/documents") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url){data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let docs = try? JSONDecoder().decode(Category.self, from: data)
            DispatchQueue.main.async{
                if let docs = docs {
                    let item = docs.data
                    print(item)
                    completion(item)
                } else {
                    completion(nil)
                }
            }
        }.resume()
    }
}
