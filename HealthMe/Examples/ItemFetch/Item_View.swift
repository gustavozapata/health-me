//
//  Item_View.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 14/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct Item_View: View {
    
    @ObservedObject var itemVM: ItemViewModel
    
    init() {
        self.itemVM = ItemViewModel()
    }
    
    func getTheItem() -> Void {
        self.itemVM.search()
    }
    
    var body: some View {
        VStack {
            Text("Resultado abajo")
            Text("\(self.itemVM.description)")
            Button(action: self.getTheItem){
                Text("Fetch")
            }
        }
    }
}

struct Item_View_Previews: PreviewProvider {
    static var previews: some View {
        Item_View()
    }
}
