//
//  DiscoverHealthMe.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 20/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct DiscoverHealthMe: View {
    var body: some View {
        VStack {
            PageView([Card(initialView: true, title: "Discover Health Me", image: "", text: "Swipe right to discover the power of Health Me in our lifes and how it can improve our overall health."), Card(initialView: false, title: "1", image: "discover01", text: "Book a blood test appointment"), Card(initialView: false, title: "2", image: "discover02", text: "Go to the nearest blood station"), Card(initialView: false, title: "3", image: "discover03", text: "Your blood is analysed in the lab"), Card(initialView: false, title: "4", image: "discover04", text: "Get a Health Me report to your phone")]).frame(height: 250)
        }.padding([.top, .bottom], 35)
    }
}

struct DiscoverHealthMe_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverHealthMe()
    }
}
