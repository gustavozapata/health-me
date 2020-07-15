//
//  AssetView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 14/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct AssetView: View {
    var assets = [Asset]()
    var hosta: LocalVars
    
    @ObservedObject var assetVM: AssetViewModel
    
    init() {
        self.assetVM = AssetViewModel()
        hosta = LocalVars()
        let urlString = "\(hosta.host)/api/v1/assets"
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url){
                parse(json: data)
            }
        }
    }
    
    mutating func parse(json: Data) {
        if let assetsJson = try? JSONDecoder().decode(Kapp.self, from: json){
            assets = assetsJson.data
        }
    }
    
    var body: some View {
        VStack {
            NavigationLink(destination: Item_View()){
                Text("Item Fetch")
                Text("\(self.assetVM.getName)")
            }
            List {
                ForEach(assets, id: \.self) {asset in
                    Text(asset.name!).padding()
                }
            }
        }
    }
}

//struct AssetView: View {
//    @ObservedObject var assetVM: AssetViewModel
//
//    init() {
//        self.assetVM = AssetViewModel()
//        print("fetched: \(self.assetVM.getDesc)")
//    }
//
//    var body: some View {
//        VStack {
//            Text("\(self.assetVM.getDesc[0].name!)")
//        }
//    }
//}

struct AssetView_Previews: PreviewProvider {
    static var previews: some View {
        AssetView()
    }
}
