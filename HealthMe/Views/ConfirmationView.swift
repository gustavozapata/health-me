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
    @State var isBooked = true
    
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
                    NavigationLink(destination: BloodTestInfo(booking: account.aBooking)){
                        AppointmentCard().padding(.top, 30)
                    }.buttonStyle(PlainButtonStyle())
                    
                    Text("Back home").underline()
                        .foregroundColor(.green).fontWeight(.semibold)
                        .padding().onTapGesture {
                            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.navigateToRoot()
                        }
                } else {
                    Loading()
                }
            }
        }.navigationBarTitle("Book Test").onAppear(){
            if account.isNewBooking {
                account.aBooking.date = dateToDateAndTime(date: account.aBooking.date, time: account.aBooking.time)
                account.addBooking() {
                    self.isBooked = true
                    account.isNewBooking = false
                    account.aCreditCard = CreditCardModel(cardNumber: "", cardHolder: "", cardExpiresYear: "", cardExpiresMonth: "", cardCVV: "")
                }
            }
        }
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView()
    }
}
