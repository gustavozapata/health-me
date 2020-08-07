//
//  DateSelect.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 07/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct DateSelect: View {
    
    var state: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 2) {
            Text("Aug").font(.system(size: 12, weight: .bold)).foregroundColor(state == "selected" ? Color.white : state == "noavailable" ? Color.gray : Color.black).padding(.top, 5)
            Text("19").font(.system(size: 25, weight: .bold)).foregroundColor(state == "selected" ? Color.white : state == "noavailable" ? Color.gray : Color.black)
            Text("Fri").font(.system(size: 15, weight: .bold)).foregroundColor(state == "selected" ? Color.white : state == "noavailable" ? Color.gray : Color.black).padding(.bottom, 5)
        }.padding(.horizontal, 16).background(state == "selected" ? Color.blue : Color.white).border(Color.black)
    }
}

struct DateSelect_Previews: PreviewProvider {
    static var previews: some View {
        DateSelect(state: "").previewLayout(.fixed(width: 65, height: 65))
    }
}
