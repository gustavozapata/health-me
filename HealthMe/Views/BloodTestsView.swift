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
    @ObservedObject var account: AccountViewModel = .account
    
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
                    if account.isLogged {
                        VStack {
                            Header(title: "Past Tests", subtitle: "See your blood tests booking history").padding(.bottom, 20)
                            if account.userModel!.bookings.count > 0 {
                                PastTestsList()
                            } else {
                                Text("You haven’t booked any blood test").font(.system(size:18)).foregroundColor(.gray).multilineTextAlignment(.center).padding(.bottom, 20)
                            }
                        }.padding(.top, 20)
                    } else {
                        Text("Register or login to see your bookings").fontWeight(.semibold).foregroundColor(.gray).padding(.vertical, 30)
                    }
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
    }
}
