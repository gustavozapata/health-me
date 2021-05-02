//
//  StationService.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 01/09/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import Foundation

/// ONLY USED FOR TESTING 
class StationService {
    
    func getStations(completion: @escaping ([StationModel]?) -> ()) {
        guard let url = URL(string: "\(LocalVars.localHost)/api/v1/stations") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
//            let stations = try? JSONDecoder().decode(MapResponse.self, from: data)
//            DispatchQueue.main.async {
//                completion(stations?.data)
//            }
            
            print("Fetch failed: \(error?.localizedDescription ?? "error desconocido")")
            print(data)
        }.resume()
    }
}
