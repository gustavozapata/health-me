//
//  CardSection.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 23/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct CardSection: View {
    var body: some View {
        VStack {
            VStack {
                Header(title: "Book Test", subtitle: "Book another blood test")
                Spacer()
                NavigationLink(destination: BookStation()){
                    BookTestButton()
                }
            }.padding(.bottom, 35).frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.theme)
                .cornerRadius(23).overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(red: 225/255, green: 232/255, blue: 239/255), lineWidth: 1)
            )
        }.padding().background(Color(red: 245/255, green: 247/255, blue: 250/255)).frame(height: 235)
    }
}

struct CardSection_Previews: PreviewProvider {
    static var previews: some View {
        CardSection()
    }
}
