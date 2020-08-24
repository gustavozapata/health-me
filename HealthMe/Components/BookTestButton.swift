//
//  BookTestButton.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 23/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct BookTestButton: View {
    
    var conic: LinearGradient
    
    init() {
        let colors = Gradient(colors: [Color(red: 80/255, green: 25/255, blue: 235/255), Color(red: 135/255, green: 49/255, blue: 234/255), Color(red: 214/255, green: 66/255, blue: 188/255), Color(red: 255/255, green: 86/255, blue: 135/255), Color(red: 255/255, green: 151/255, blue: 114/255), Color(red: 255/255, green: 220/255, blue: 120/255)])
        conic = LinearGradient(gradient: colors, startPoint: .leading, endPoint: .trailing)
    }
    
    var body: some View {
        Text("Book a blood test").padding(EdgeInsets(top: 13, leading: 20, bottom: 13, trailing: 20)).background(Color.white).cornerRadius(25)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(conic, lineWidth: 4)
        ).font(.system(size: 17, weight: .semibold)).foregroundColor(Color.primary)
    }
}

struct BookTestButton_Previews: PreviewProvider {
    static var previews: some View {
        BookTestButton()
    }
}
