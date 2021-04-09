//
//  Card.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 20/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct Card: View {
    
    var initialView: Bool
    var title: String
    var image: String
    var text: String
    
    var body: some View {
        VStack {
            VStack {
                if self.initialView {
                    Text(self.title).font(.system(size: 20, weight: .bold))
                    Text(self.text).multilineTextAlignment(.center).padding()
                    Text("<<< swipe").foregroundColor(Color(red: 23/255, green: 108/255, blue: 236/255)).fontWeight(.semibold)
                } else {
                    HStack(alignment: .top) {
                        Text(self.title).font(.system(size: 20, weight: .bold)).padding(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8)).overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.themeReverse, lineWidth: 1)
                        )
                        Spacer()
                        Image(self.image).resizable().aspectRatio(contentMode: .fit).offset(x: -10)
                        Spacer()
                    }
                    Text(self.text).multilineTextAlignment(.center).padding().font(.system(size: 16, weight: .medium))
                }
                
            }.padding().frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.theme)
                .cornerRadius(23).overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.border, lineWidth: 1)
            )
        }.padding().background(Color.bgBlue)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(initialView: false, title: "2", image: "discover01", text: "description")
            .preferredColorScheme(.dark)
    }
}
