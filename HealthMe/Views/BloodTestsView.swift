//
//  BloodTestsView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 10/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct BloodTestsView: View {
    var conic: LinearGradient
    var w: Int
    @Environment(\.colorScheme) var colorScheme
    init() {
        let colors = Gradient(colors: [.green, .orange, .pink, .red, .purple])
        conic = LinearGradient(gradient: colors, startPoint: .leading, endPoint: .trailing)
        w = Int(UIScreen.main.bounds.width)
    }
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                
                //Container
                VStack {
                    
                    BookTestCard().padding(.bottom, 30)
                    
                    DiscoverHealthMe()
                    
                    //Section - Past Tests
                    VStack {
                        Header(title: "Past Tests", subtitle: "See your blood tests booking history")
                        
                        PastTestsList(pastTests: BloodTestData())
//                        Text("You haven’t booked any blood test") //You don’t have any blood test booked
//                            .font(.system(size: 18)).foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 1.0)).multilineTextAlignment(.center).padding(.bottom, 20)
                    }.padding(.top, 20)
                    
                }.padding(.bottom, 30)
                //Container
                
            } //ScrollView
                .navigationBarTitle("Blood Tests")
        }
    }
}

struct BloodTestsView_Previews: PreviewProvider {
    static var previews: some View {
        BloodTestsView()
        //                BloodTestsView().environment(\.colorScheme, .dark)
    }
}
