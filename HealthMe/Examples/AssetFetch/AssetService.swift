//
//  AssetService.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 14/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import Foundation

class AssetService {
    
    func getAssets(completion: @escaping ([Asset]?) -> ()) {
        var assets = [Asset]()
        let hosta = LocalVars()
        
        guard let url = URL(string: "\(hosta.host)/api/v1/assets") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            if let assetsJson = try? JSONDecoder().decode(Kapp.self, from: data){
                
                DispatchQueue.main.async {
                    assets = assetsJson.data
                    completion(assets)
                }
            }
        }.resume()
    }
}
