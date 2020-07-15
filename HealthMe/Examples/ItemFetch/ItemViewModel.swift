//
//  ItemViewModel.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 14/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import Foundation
import Combine

class ItemViewModel: ObservableObject {
    private var itemService: ItemService!
    
    @Published var item = Item()
    
    init() {
        self.itemService = ItemService()
        fetchItems(by: "swiftui")
    }
    
    var description: String {
        if let temp = self.item.description {
            return String(temp)
        } else {
            return ""
        }
    }
    
    func search() {
        fetchItems(by: "search")
    }
    
    private func fetchItems(by elemento: String) {
        self.itemService.getItems(elemento: elemento){ item in
            if let item = item {
                DispatchQueue.main.async {
                    self.item = item
                }
            }
        }
    }
}
