//
//  ConfirmButton.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 23/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct ConfirmButton: View {
    var body: some View {
        Text("Confirm").padding().font(.system(size: 20, weight: .bold)).foregroundColor(Color.white).frame(maxWidth: .infinity).background((LinearGradient(gradient: Gradient(colors: [Color(red: 96/255, green: 223/255, blue: 36/255), Color(red: 9/255, green: 159/255, blue: 33/255)]), startPoint: .leading, endPoint: .trailing)))
    }
}

struct ConfirmButton_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmButton()
    }
}
