//
//  AssetViewModel.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 14/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import Foundation

class AssetViewModel: ObservableObject {
    private var assetService: AssetService!
    
    @Published var asset = Asset()
    
    init() {
        self.assetService = AssetService()
        fetchAssets()
    }
    
    var getName: String {
        if let el = self.asset.name {
            return el
        } else {
            return ""
        }
    }
    
    private func fetchAssets() {
        self.assetService.getAssets(){ asset in
            if let asset = asset {
                DispatchQueue.main.async {
                    self.asset = asset[0]
                }
            }
        }
    }
}

//class AssetViewModel: ObservableObject {
//    private var assetService: AssetService!
//
//    @Published var asset = [Asset]()
//
//    init() {
//        self.assetService = AssetService()
//        fetchAssets()
//    }
//
//    func getAll() -> Void {
//        return fetchAssets()
//    }
//
//    var getName: String {
//        if let el = self.asset[0].name {
//            return el
//        } else {
//            return ""
//        }
//    }
//
//    var getDesc: [Asset] {
//        self.asset
//    }
//
//    func fetchAssets() {
//        self.assetService.getAssets(){ asset in
//            if let asset = asset {
//                DispatchQueue.main.async {
//                    self.asset = asset
//                }
//            }
//        }
//    }
//}
