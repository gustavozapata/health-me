//
//  ConfirmationView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 30/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct ConfirmationView: View {
    @ObservedObject var account: AccountViewModel = .account
    @State var isBooked = false
    
    var body: some View {
        ScrollView {
            VStack {
                if self.isBooked {
                    VStack {
                        Header(title: "Confirmation", subtitle: "Your blood test has been booked")
                    }
                    VStack {
                        Image("thanks").resizable().aspectRatio(contentMode: .fit).frame(width: 200)
                        Text("Thanks!").font(.system(size: 25, weight: .bold))
                    }
                    NavigationLink(destination: BloodTestInfo(booking: account.userModel!.bookings[0])){
                        AppointmentCard().padding(.top, 30)
                    }.buttonStyle(PlainButtonStyle())
                    
                    Text("Add to your calendar").underline().fontWeight(.medium).foregroundColor(Color(red: 12/255, green: 92/255, blue: 214/255)).padding()
                } else {
                    Text("Loading...")
                }
            }
        }.navigationBarTitle("Book Test").onAppear(){
            account.addBooking() {
                self.isBooked = true
            }
        }
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView()
    }
}
