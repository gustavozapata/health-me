//
//  BookTestCard.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 20/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct BookTestCard: View {
    var conic: LinearGradient
    var w: Int
    init() {
        let colors = Gradient(colors: [Color(red: 80/255, green: 25/255, blue: 235/255), Color(red: 135/255, green: 49/255, blue: 234/255), Color(red: 214/255, green: 66/255, blue: 188/255), Color(red: 255/255, green: 86/255, blue: 135/255), Color(red: 255/255, green: 151/255, blue: 114/255), Color(red: 255/255, green: 220/255, blue: 120/255)])
        conic = LinearGradient(gradient: colors, startPoint: .leading, endPoint: .trailing)
        w = Int(UIScreen.main.bounds.width)
    }
    var body: some View {
        VStack {
            Header(title: "Book Test", subtitle: "Book an appointment to the nearest blood station quick and easy")
            
            Image("nobookings").resizable().aspectRatio(contentMode: .fit)
            NavigationLink(destination: BookTestView()){
                Text("Book a blood test").padding(EdgeInsets(top: 13, leading: 20, bottom: 13, trailing: 20)).background(Color.white).cornerRadius(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(conic, lineWidth: 4)
                ).font(.system(size: 17, weight: .semibold)).foregroundColor(Color.primary)
            }.padding(.bottom, 30)
            
        }.background(LinearGradient(gradient: Gradient(colors: [Color(red: 222/255, green: 251/255, blue: 255/255), Color(red: 219/255, green: 233/255, blue: 255/255)]), startPoint: .top, endPoint: .bottom)).cornerRadius(22).clipped().shadow(color: Color(red: 200/255, green: 200/255, blue: 200/255), radius: 7, x: 0, y: 2).padding()
    }
}

struct BookTestCard_Previews: PreviewProvider {
    static var previews: some View {
        BookTestCard()
    }
}
