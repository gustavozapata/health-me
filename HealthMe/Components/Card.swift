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
                                .stroke(Color.black, lineWidth: 2)
                        )
                        Spacer()
                        Image(self.image).resizable().aspectRatio(contentMode: .fit).offset(x: -10)
                        Spacer()
                    }
                    Text(self.text).multilineTextAlignment(.center).padding().font(.system(size: 16, weight: .medium))
                }
                
            }.padding().frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.white)
                .cornerRadius(23).overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(red: 225/255, green: 232/255, blue: 239/255), lineWidth: 1)
            )
        }.padding().background(Color(red: 245/255, green: 247/255, blue: 250/255))
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(initialView: false, title: "2", image: "discover01", text: "description")
    }
}
