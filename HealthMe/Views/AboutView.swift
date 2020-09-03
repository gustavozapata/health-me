//
//  AboutView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 31/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack {
                Header(title: "Health Me", subtitle: "Get to know yourself better")
            }
            
            VStack {
                Image("gz").resizable().aspectRatio(contentMode: .fit).frame(width: 100)
                Text("gustavozapata.me").foregroundColor(Color.secondary)
            }
        }.navigationBarTitle("About")
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
