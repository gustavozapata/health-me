//
//  CreditCard.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 27/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct CreditCard: View {
    var body: some View {
        ZStack{
            VStack {
                Text("5249 9855 8485 3495").fontWeight(.semibold)
//                Text("CARD HOLDER").fontWeight(.semibold)
            }.foregroundColor(Color.white).font(.custom("Courier", size: 20))
        }.frame(width: 290, height: 160).background(LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 182/255, blue: 43/255), Color(red: 255/255, green: 22/255, blue: 87/255), Color(red: 255/255, green: 2/255, blue: 155/255)]), startPoint: .bottomLeading, endPoint: .topTrailing)).cornerRadius(16).shadow(color: Color(red: 200/255, green: 200/255, blue: 200/255), radius: 7, x: 0, y: 2).padding()
    }
}

struct CreditCard_Previews: PreviewProvider {
    static var previews: some View {
        CreditCard()
    }
}
