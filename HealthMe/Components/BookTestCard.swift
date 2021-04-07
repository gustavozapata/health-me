//
//  BookTestCard.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 20/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct BookTestCard: View {
    
    @ObservedObject var account: AccountViewModel = .account
    var w: Int
    
    init() {
        w = Int(UIScreen.main.bounds.width)
    }
    var body: some View {
        VStack {
            Header(title: "Book Test", subtitle: "Book an appointment to the nearest blood station quick and easy")
            
            Image("nobookings").resizable().aspectRatio(contentMode: .fit).frame(width: 300)
            
            if account.isLogged {
                NavigationLink(destination: BookStation()){
                    BookTestButton()
                }.padding(.bottom, 30)
            } else {
                Text("Login to be able to book").font(.system(size: 15, weight: .semibold)).padding(.bottom, 30).foregroundColor(.gray)
            }
            
            
        }.background(LinearGradient(gradient: Gradient(colors: [Color(red: 222/255, green: 251/255, blue: 255/255), Color(red: 219/255, green: 233/255, blue: 255/255)]), startPoint: .top, endPoint: .bottom)).cornerRadius(22).clipped().shadow(color: Color(red: 200/255, green: 200/255, blue: 200/255), radius: 7, x: 0, y: 2).padding()
    }
}

struct BookTestCard_Previews: PreviewProvider {
    static var previews: some View {
        BookTestCard()
    }
}
